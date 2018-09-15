//
//  NSDictionary+BHUtility.m
//  Foundation
//
//  Created by QiaoBaHui on 2018/9/15.
//  Copyright © 2018年 QiaoBaHui. All rights reserved.
//

#import "NSDictionary+BHUtility.h"

@implementation NSDictionary (BHUtility)

- (NSString*)toJSONString {
  NSError *parseError = nil;
  NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&parseError];

  return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (NSData *)toJSONData {
  NSError *parseError = nil;
  NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&parseError];

  return jsonData;
}

- (NSNumber *)integerForKey:(NSString *)key {
  id value = [self valueForKey:key];
  if ([NSNull null] == value) {
    return nil;
  }

  return [NSNumber numberWithInteger:[value integerValue]];
}

- (NSNumber *)floatForKey:(NSString *)key {
  id value = [self valueForKey:key];
  if ([NSNull null] == value) {
    return nil;
  }

  return [NSNumber numberWithFloat:[value floatValue]];
}

- (NSNumber *)doubleForKey:(NSString *)key {
  id value = [self valueForKey:key];
  if ([NSNull null] == value) {
    return nil;
  }

  return [NSNumber numberWithDouble:[value doubleValue]];
}

- (NSDecimalNumber *)decimalForKey:(NSString *)key {
  id value = [self valueForKey:key];
  if ([NSNull null] == value) {
    return nil;
  }

  return [NSDecimalNumber decimalNumberWithDecimal:[value decimalValue]];
}

- (NSNumber *)boolForKey:(NSString *)key {
  id value = [self valueForKey:key];
  if ([NSNull null] == value) {
    return nil;
  }

  return [NSNumber numberWithBool:[value boolValue]];
}

- (NSString *)stringForKey:(NSString *)key {
  id value = [self valueForKey:key];
  if (!value || [NSNull null] == value) {
    return @"";
  }
  if ([value isKindOfClass:[NSNumber class]]) {
    return [value stringValue];
  }
  if (![value isKindOfClass:[NSString class]]) {
    return @"";
  }
  if ([@"null" isEqualToString:value]) {
    return @"";
  }

  return value;
}

- (NSArray *)arrayForKey:(NSString *)key {
  id value = [self valueForKey:key];
  if (!value || [NSNull null] == value) {
    return [NSArray array];
  }
  if (![value isKindOfClass:[NSArray class]]) {
    return [NSArray array];
  }
  return value;
}

- (NSDictionary *)dictionaryForKey:(NSString *)key {
  id value = [self valueForKey:key];
  if (!value || [NSNull null] == value) {
    return [NSDictionary dictionary];
  }
  if (![value isKindOfClass:[NSDictionary class]]) {
    return [NSDictionary dictionary];
  }

  return value;
}

@end
