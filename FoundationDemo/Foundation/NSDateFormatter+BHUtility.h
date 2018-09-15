//
//  NSDateFormatter+BHUtility.h
//  Foundation
//
//  Created by QiaoBaHui on 2018/9/15.
//  Copyright © 2018年 QiaoBaHui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (BHUtility)

/**
 * Return: 将总秒数转换成小时数
 **/
+ (NSString *)stringFromTotalSeconds:(NSInteger)totalSeconds;

/**
 * Return: 将Data转化为 yyyy年MM月dd日
 **/
+ (NSString *)ymdSeparatedByChineseFromDate:(NSDate *)date;

/**
 * Return: 将Data转化为 yyyy-MM-dd
 **/
+ (NSString *)ymdSeparatedByHLineFromDate:(NSDate *)date;

/**
 * Return: 将Data转化为 yyyy-MM-dd HH:mm:ss
 **/
+ (NSString *)ymdhmsSeparatedByHLineFromDate:(NSDate *)date;

/**
 * Return: 将yyyy-MM-dd HH:mm:ss 转化为 yyyy年MM月dd日
 **/
+ (NSString *)ymdSeparatedByChineseFromString:(NSString *)ymdhmsByHLineString;

@end
