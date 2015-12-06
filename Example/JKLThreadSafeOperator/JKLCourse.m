//
//  JKLCourse.m
//  JKLThreadSafeOperator
//
//  Created by jiakai lian on 3/12/2015.
//  Copyright © 2015 Jiakai Lian. All rights reserved.
//

#import "JKLCourse.h"

@implementation JKLCourse

- (instancetype)init {
  self = [super init];
  if (self) {
    _students = [NSArray array];
  }
  return self;
}

- (void)addStudentWithStudentName:(NSString *)studentName {
  NSMutableArray *array = [NSMutableArray arrayWithArray:self.students];
  [array addObject:studentName];
  self.students = array;
}

@end
