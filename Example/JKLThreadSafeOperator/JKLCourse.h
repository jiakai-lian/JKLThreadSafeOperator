//
//  JKLCourse.h
//  JKLThreadSafeOperator
//
//  Created by jiakai lian on 3/12/2015.
//  Copyright © 2015 Jiakai Lian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKLCourse : NSObject

@property(nonatomic, copy) NSArray *students;

- (void)addStudentWithStudentName:(NSString *)studentName;

@end
