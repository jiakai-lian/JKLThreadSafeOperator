//
//  JKLItem.m
//  JKLThreadSafeOperator
//
//  Created by jiakai lian on 3/12/2015.
//  Copyright © 2015 Jiakai Lian. All rights reserved.
//

#import "JKLItem.h"

@implementation JKLItem

- (instancetype)init {
  self = [super init];
  if (self) {
    _subItems = [NSArray array];
  }
  return self;
}

- (void)addsubItem:(NSString *)string {
  NSMutableArray *array = [NSMutableArray arrayWithArray:self.subItems];
  [array addObject:string];
  self.subItems = array;
}

@end
