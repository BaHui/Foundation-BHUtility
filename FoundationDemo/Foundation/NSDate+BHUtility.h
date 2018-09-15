//
//  NSDate+BHUtility.h
//  Foundation
//
//  Created by QiaoBaHui on 2018/9/15.
//  Copyright © 2018年 QiaoBaHui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (BHUtility)

/**
 * Return: 当前时间戳(单位: 毫秒)
 **/
+ (NSNumber *)currentMilliSecondsTimestamp;

/**
 * Return: 当前时间戳(单位: 秒)
 **/
+ (NSNumber *)currentSecondsTimestamp;

/**
 * Return: NSDate 转化为 时间戳(秒)
 **/
+ (NSNumber *)secondTimestampWithDate:(NSDate *)date;

/**
 * Return: NSDate 转化为 时间戳(毫秒)
 **/
+ (NSNumber *)milliSecondTimestampWithDate:(NSDate *)date;

/**
 * Return: 时间戳(秒) 转化为 NSDate
 **/
+ (NSDate *)dateSinceNowWithTimeInterval:(NSTimeInterval)timestamp;

/**
 * Return: yyyy-MM-dd格式的时间字符 转化为 NSDate
 **/
+ (NSDate *)dataFromYMDStringTime:(NSString *)stringTime;

/**
 * Return: yyyy-MM-dd HH:mm:ss格式的时间字符 转化为 NSDate
 **/
+ (NSDate *)dataFromYMDAndHMSStringTime:(NSString *)stringTime;

/**
 * Return: 当前时间距离过去某个时间戳的秒数(单位: 秒)
 **/
+ (NSInteger)distanceSecondsFromPastSecondsTimestamp:(NSTimeInterval)pastSecondsTimestamp;


@end
