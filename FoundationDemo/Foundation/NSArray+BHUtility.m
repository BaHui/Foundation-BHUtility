//
//  NSArray+BHUtility.m
//  Foundation
//
//  Created by QiaoBaHui on 2018/8/27.
//  Copyright © 2018年 QiaoBaHui. All rights reserved.
//

#import "NSArray+BHUtility.h"

@implementation NSArray (BHUtility)

- (NSArray *)reversedArray {
  NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
  NSEnumerator *enumerator = [self reverseObjectEnumerator];
  for (id element in enumerator) {
    [array addObject:element];
  }
  return array;
}

- (NSArray *)sortArrayWithKey:(NSString *)sortKey ascending:(BOOL)ascending {
  NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:sortKey ascending:ascending];
  return [self sortedArrayUsingDescriptors:@[descriptor]];
}

@end
