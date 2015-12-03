//
//  JKLThreadSafeOperator.h
//  Pods
//
//  Created by jiakai lian on 3/12/2015.
//
//

#import <Foundation/Foundation.h>

@interface JKLThreadSafeOperator : NSObject

+ (void) syncReadWithObject:(id)object readBlock:(void (^) (id object)) readBlock;
+ (void) barrierAsyncWriteWithObject:(id)object writeBlock:(void (^) (id object)) writeBlock;

@end
