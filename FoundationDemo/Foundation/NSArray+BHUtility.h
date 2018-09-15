//
//  NSArray+BHUtility.h
//  Foundation
//
//  Created by QiaoBaHui on 2018/8/27.
//  Copyright © 2018年 QiaoBaHui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (BHUtility)

/**
 * 将数组中的元素顺序颠倒, 重新生成一个数组;
 **/
- (NSArray *)reversedArray;

/**
 * 根据key对数组进行排序, YES为升序, 反之为逆序;
 **/
- (NSArray *)sortArrayWithKey:(NSString *)sortKey ascending:(BOOL)ascending;

@end
