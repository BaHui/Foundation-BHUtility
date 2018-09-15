//
//  NSBundle+BHUtility.m
//  Foundation
//
//  Created by QiaoBaHui on 2018/9/15.
//  Copyright © 2018年 QiaoBaHui. All rights reserved.
//

#import "NSBundle+BHUtility.h"

@implementation NSBundle (BHUtility)

+ (NSString *)buildString {
  static NSString* build = nil;
  if (nil == build) {
    build = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleVersion"];
  }
  return build;
}

+ (NSString *)versionString {
  static NSString* version = nil;
  if (nil == version) {
    version = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
  }
  return version;
}

@end
