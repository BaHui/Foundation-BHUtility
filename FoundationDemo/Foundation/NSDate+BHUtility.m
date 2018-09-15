//
//  NSDate+BHUtility.m
//  Foundation
//
//  Created by QiaoBaHui on 2018/9/15.
//  Copyright © 2018年 QiaoBaHui. All rights reserved.
//

#import "NSDate+BHUtility.h"

@implementation NSDate (BHUtility)

+ (NSNumber *)currentMilliSecondsTimestamp {
  return [NSNumber numberWithInteger:([[self date] timeIntervalSince1970]) * 1000];
}

+ (NSNumber *)currentSecondsTimestamp {
  return [NSNumber numberWithInteger:[[self date] timeIntervalSince1970]];
}

+ (NSNumber *)secondTimestampWithDate:(NSDate *)date {
  return [NSNumber numberWithDouble:[date timeIntervalSince1970]];
}

+ (NSNumber *)milliSecondTimestampWithDate:(NSDate *)date {
  return [NSNumber numberWithDouble:[date timeIntervalSince1970] * 1000];
}

+ (NSDate *)dateSinceNowWithTimeInterval:(NSTimeInterval)timestamp {
  return [NSDate dateWithTimeIntervalSinceNow:timestamp];
}

+ (NSDate *)dataFromYMDStringTime:(NSString *)stringTime {
  static NSDateFormatter* dateFormat = nil;
  if (!dateFormat) {
    dateFormat = [[NSDateFormatter alloc] init];
  }
  [dateFormat setDateFormat:@"yyyy-MM-dd"];
  NSDate *date=[dateFormat dateFromString:stringTime];

  return date;
}

+ (NSDate *)dataFromYMDAndHMSStringTime:(NSString *)stringTime {
  static NSDateFormatter* dateFormat = nil;
  if (!dateFormat) {
    dateFormat = [[NSDateFormatter alloc] init];
  }
  [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
  NSDate *date=[dateFormat dateFromString:stringTime];

  return date;
}

+ (NSInteger)distanceSecondsFromPastSecondsTimestamp:(NSTimeInterval)pastSecondsTimestamp {
  NSTimeInterval distanceTimestamp = [[self currentSecondsTimestamp] doubleValue] - pastSecondsTimestamp;
  NSInteger distanceSeconds = round(distanceTimestamp);

  return (distanceSeconds > 0) ? distanceSeconds : 0;
}

@end
