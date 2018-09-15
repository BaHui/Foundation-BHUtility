//
//  NSString+BHUtility.h
//  Foundation
//
//  Created by QiaoBaHui on 2018/8/27.
//  Copyright © 2018年 QiaoBaHui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BHUtility)

/**
 * return: 字母全部大写;
 **/
- (NSString *)toUppercase;

/**
 *return: 移除了空格和换行
 **/
- (NSString *)removeWhitespace;

/**
 * return: 被MD5加密的字符串;
 **/
- (NSString *)md5Hash;

/**
 * return: 被JSON化的字典;
 **/
- (NSDictionary *)toDictionaryFromJSON;

/**
 * return: 加密手机号, eg: 188****8888;
 **/
- (NSString *)phoneNumberToEncrypt;

/**
 * return: 将string字符替换为: toString;
 **/
- (NSString *)replace:(NSString *)string toString:(NSString *)toString;

/**
 * 判断字符串为空
 **/
- (BOOL)isBlank;

/**
 * 判断字符串不为空
 **/
- (BOOL)isNotBlank;

/**
 * return: 判断是否为有效的手机号;
 **/
- (BOOL)isValidPhoneNumber;

/**
 * return: 判断是否为有效的车牌号;
 **/
- (BOOL)isValidLicensePlateNumber;

/**
 * return: 判断是否为有效的身份证号;
 **/
- (BOOL)isValidIdCardNumber;

@end
