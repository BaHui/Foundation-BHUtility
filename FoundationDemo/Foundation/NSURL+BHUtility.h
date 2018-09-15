//
//  NSURL+BHUtility.h
//  Foundation
//
//  Created by QiaoBaHui on 2018/9/15.
//  Copyright © 2018年 QiaoBaHui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (BHUtility)

/**
 * Return: 链接中提取所有的参数
 **/
+ (NSDictionary *)parametersFormUrlString:(NSString *)urlString;

/**
 * Return: 删除键值对
 **/
+ (NSString *)deleteParameterOfKey:(NSString *)key urlString:(NSString *)urlString;

/**
 * Return: 增加键值对
 **/
+ (NSString *)addParameters:(NSDictionary *)parameters urlString:(NSString *)urlString;

@end
