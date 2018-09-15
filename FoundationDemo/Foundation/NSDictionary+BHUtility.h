//
//  NSDictionary+BHUtility.h
//  Foundation
//
//  Created by QiaoBaHui on 2018/9/15.
//  Copyright © 2018年 QiaoBaHui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (BHUtility)

/**
 * Return: 将字典转化为JSON格式的字符串
 **/
- (NSString *)toJSONString;

/**
 * Return: 将字典转化为JSON Data
 **/
- (NSData *)toJSONData;

/**
 * Return: 将字典取值的安全处理
 **/
- (NSNumber *)integerForKey:(NSString *)key;
- (NSNumber *)floatForKey:(NSString *)key;
- (NSNumber *)doubleForKey:(NSString *)key;
- (NSDecimalNumber *)decimalForKey:(NSString *)key;
- (NSNumber *)boolForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key;
- (NSArray *)arrayForKey:(NSString *)key;
- (NSDictionary *)dictionaryForKey:(NSString *)key;

@end
