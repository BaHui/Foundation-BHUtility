//
//  NSBundle+BHUtility.h
//  Foundation
//
//  Created by QiaoBaHui on 2018/9/15.
//  Copyright © 2018年 QiaoBaHui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (BHUtility)

/**
 * Return: Build号
 **/
+ (NSString *)buildString;

/**
 * Return: 版本号
 **/
+ (NSString *)versionString;

@end
