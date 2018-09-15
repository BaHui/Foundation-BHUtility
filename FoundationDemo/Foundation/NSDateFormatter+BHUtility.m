//
//  NSDateFormatter+BHUtility.m
//  Foundation
//
//  Created by QiaoBaHui on 2018/9/15.
//  Copyright © 2018年 QiaoBaHui. All rights reserved.
//

#import "NSDateFormatter+BHUtility.h"

@implementation NSDateFormatter (BHUtility)

+ (NSString *)stringFromTotalSeconds:(NSInteger)totalSeconds {
  NSInteger interval = totalSeconds;
  long seconds = interval % 60;
  long minutes = (interval / 60) % 60;
  long hours = (interval / 3600);

  return [NSString stringWithFormat:@"%0.2ld:%0.2ld:%0.2ld", hours, minutes, seconds];
}

+ (NSString *)ymdSeparatedByChineseFromDate:(NSDate *)date {
  static NSDateFormatter* dateFormat = nil;
  if (!dateFormat) {
    dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy年MM月dd日"];
  }
  return [dateFormat stringFromDate:date];
}

+ (NSString *)ymdSeparatedByHLineFromDate:(NSDate *)date {
  static NSDateFormatter* dateFormat = nil;
  if (!dateFormat) {
    dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
  }
  return [dateFormat stringFromDate:date];
}

+ (NSString *)ymdhmsSeparatedByHLineFromDate:(NSDate *)date {
  static NSDateFormatter* dateFormat = nil;
  if (!dateFormat) {
    dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  }
  return [dateFormat stringFromDate:date];
}

+ (NSString *)ymdSeparatedByChineseFromString:(NSString *)ymdhmsByHLineString {
  static NSDateFormatter* dateFormat = nil;
  if (!dateFormat) {
    dateFormat = [[NSDateFormatter alloc] init];
  }
  [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  NSDate *date=[dateFormat dateFromString:ymdhmsByHLineString];

  [dateFormat setDateFormat:@"yyyy年MM月dd日"];

  return [dateFormat stringFromDate:date];
}

@end
