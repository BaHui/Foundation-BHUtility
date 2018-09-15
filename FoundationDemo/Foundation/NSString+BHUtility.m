//
//  NSString+BHUtility.m
//  Foundation
//
//  Created by QiaoBaHui on 2018/8/27.
//  Copyright © 2018年 QiaoBaHui. All rights reserved.
//

#import "NSString+BHUtility.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (BHUtility)

- (NSString *)toUppercase {
  return [self uppercaseString];
}

- (NSString *)removeWhitespace{
  NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
  NSString *trimmed = [self stringByTrimmingCharactersInSet:whitespace];

  return trimmed;
}

- (NSString *)md5Hash {
  const char* input = [self UTF8String];
  unsigned char result[CC_MD5_DIGEST_LENGTH];
  CC_MD5(input, (CC_LONG)strlen(input), result);

  NSMutableString *md5String = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
  for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
    [md5String appendFormat:@"%02x", result[i]];
  }

  return md5String;
}

- (NSDictionary *)toDictionaryFromJSON {
  id result = [NSJSONSerialization JSONObjectWithData: [self dataUsingEncoding:NSUTF8StringEncoding] options: NSJSONReadingAllowFragments error: nil];
  if ([result isKindOfClass:[NSString class]]) {
    result = [result toDictionaryFromJSON];
  }
  
  return result;
}

- (NSString *)phoneNumberToEncrypt {
  if ([self isValidPhoneNumber]) {
    return [self stringByReplacingCharactersInRange:NSMakeRange(3, 4)withString:@"****"];
  } else {
    return self;
  }
}

- (NSString *)replace:(NSString *)string toString:(NSString *)toString {
  return [self stringByReplacingOccurrencesOfString:string withString:toString];
}

- (BOOL)isBlank {
  return self == nil || [self isEqual:[NSNull null]] || [self isEqual:@"null"] || [self isEqual:@"(null)"]
  || ([self respondsToSelector:@selector(length)] && [(NSData *)self length] == 0)
  || ([self respondsToSelector:@selector(count)] && [(NSArray *)self count] == 0);
}

- (BOOL)isNotBlank {
  BOOL isNotBlank = NO;
  NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
  NSString *trimmed = [self stringByTrimmingCharactersInSet:whitespace];
  if ([trimmed length] > 0) {
    isNotBlank = YES;
  }

  return isNotBlank;
}

- (BOOL)isValidPhoneNumber {
  NSString *pattern = @"^1[3-9]\\d{9}$";
  NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];

  return [pred evaluateWithObject:self];
}

- (BOOL)isValidLicensePlateNumber {
  NSString *pattern = @"^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[警京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼]{0,1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$";
  NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];

  return [pred evaluateWithObject:self];
}

- (BOOL)isValidIdCardNumber {
  NSString *pattern = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
  NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
  
  return [pred evaluateWithObject:self];
}

@end
