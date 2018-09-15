//
//  NSURL+BHUtility.m
//  Foundation
//
//  Created by QiaoBaHui on 2018/9/15.
//  Copyright © 2018年 QiaoBaHui. All rights reserved.
//

#import "NSURL+BHUtility.h"

@implementation NSURL (BHUtility)

+ (NSDictionary *)parametersFormUrlString:(NSString *)urlString {
  NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

  NSRange markRange = [urlString rangeOfString:@"?"];
  if (markRange.location != NSNotFound) {
    NSString *parametersString = [urlString substringFromIndex:markRange.location + 1];

    if ([parametersString containsString:@"&"]) {
      NSArray *keyAndValueDatas = [parametersString componentsSeparatedByString:@"&"];
      for (NSString *keyAndValueData in keyAndValueDatas) {
        NSArray *separatedDatas = [keyAndValueData componentsSeparatedByString:@"="];

        NSString *key = [separatedDatas.firstObject stringByRemovingPercentEncoding];
        NSString *value = [separatedDatas.lastObject stringByRemovingPercentEncoding];
        if (key == nil || value == nil) {
          continue;
        }

        id existValue = [parameters valueForKey:key];

        if (existValue != nil) {
          if ([existValue isKindOfClass:[NSArray class]]) {
            NSMutableArray *items = [NSMutableArray arrayWithArray:existValue];
            [items addObject:value];

            [parameters setValue:items forKey:key];
          } else {
            [parameters setValue:@[existValue, value] forKey:key];
          }
        } else {
          [parameters setValue:value forKey:key];
        }
      }
    } else {
      NSArray *separatedDatas = [parametersString componentsSeparatedByString:@"="];
      if (separatedDatas.count == 1) {
        return nil;
      }

      NSString *key = [separatedDatas.firstObject stringByRemovingPercentEncoding];
      NSString *value = [separatedDatas.lastObject stringByRemovingPercentEncoding];

      if (key == nil || value == nil) {
        return nil;
      }

      [parameters setValue:value forKey:key];
    }
  }

  return parameters;
}

+ (NSString *)deleteParameterOfKey:(NSString *)key urlString:(NSString *)urlString {
  NSString *finalString = urlString;

  if ([urlString containsString:key]) {
    NSMutableString *mutableString = [NSMutableString stringWithString:urlString];
    NSArray *strArray = [mutableString componentsSeparatedByString:key];

    NSMutableString *firstStr = [strArray objectAtIndex:0];
    NSMutableString *lastStr = [strArray lastObject];

    NSRange characterRange = [lastStr rangeOfString:@"&"];

    if (characterRange.location !=NSNotFound) {
      NSArray *lastArray = [lastStr componentsSeparatedByString:@"&"];
      NSMutableArray *mutArray = [NSMutableArray arrayWithArray:lastArray];
      [mutArray removeObjectAtIndex:0];

      NSString *modifiedStr = [mutArray componentsJoinedByString:@"&"];
      finalString = [[strArray objectAtIndex:0]stringByAppendingString:modifiedStr];
    } else {
      finalString = [firstStr substringToIndex:[firstStr length] - 1];
    }
  }

  return finalString;
}

+ (NSString *)addParameters:(NSDictionary *)parameters urlString:(NSString *)urlString {
  NSMutableArray *parts = [NSMutableArray array];

  for (NSString *key in [parameters allKeys]) {
    NSString *part = [NSString stringWithFormat:@"%@=%@", key, [parameters valueForKey:key]];
    [parts addObject: part];
  }

  NSString *parametersString= [parts componentsJoinedByString: @"&"];

  NSString *addSuffixString = @"";
  if ([[self parametersFormUrlString:urlString] count] > 0) {
    addSuffixString = [NSString stringWithFormat:@"%@%@", @"&", parametersString];
  } else {
    addSuffixString = [NSString stringWithFormat:@"%@%@", @"?", parametersString];
  }

  return [urlString stringByAppendingString:addSuffixString];
}

@end


