//
//  JKLViewController.m
//  JKLThreadSafeOperator
//
//  Created by Jiakai Lian on 12/02/2015.
//  Copyright (c) 2015 Jiakai Lian. All rights reserved.
//

#import "JKLViewController.h"
#import "JKLCourse.h"
#import <JKLThreadSafeOperator/JKLThreadSafeOperator.h>

#define TICK NSDate *startTime = [NSDate date]
#define TOCK                                                                   \
NSLog(@"%@ Time: %f subItemsCount: %ld", NSStringFromClass(course.class),      \
-[startTime timeIntervalSinceNow],                                     \
(unsigned long)[course students].count)

static const NSUInteger DISPATCH_QUEUE_COUNT = 100000;
static const NSUInteger ITERATION_COUNT = 1;

void testScenario(JKLCourse * course) {
    @autoreleasepool {
        dispatch_queue_t queue =
        dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        
        TICK;
        
        dispatch_apply(DISPATCH_QUEUE_COUNT, queue, ^(size_t i) {
            if (!(i % 10))
            {
                [JKLThreadSafeOperator barrierAsyncWriteWithObject:course writeBlock:^(JKLCourse * innerWritableCourse) {
                    [innerWritableCourse addStudentWithStudentName:@"Bob"];
                }];
                
            }
            else {
                __block NSUInteger studentsCount;
                [JKLThreadSafeOperator syncReadWithObject:course readBlock:^(JKLCourse * innerReadOnlyCourse) {
                    studentsCount = [innerReadOnlyCourse students].count;
                }];
            }
        });
        
        TOCK;
    }
}

@interface JKLViewController ()

@end

@implementation JKLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    for (NSUInteger i = 0; i < ITERATION_COUNT; i++) {
        testScenario([[JKLCourse alloc] init]);
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
