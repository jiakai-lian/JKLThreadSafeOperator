//
//  JKLThreadSafeOperator.h
//  Pods
//
//  Created by jiakai lian on 3/12/2015.
//
//

#import <Foundation/Foundation.h>

@protocol ReadOnly
@end

@protocol ReadWrite
@end

@interface JKLThreadSafeOperator : NSObject

+ (void) syncReadWithObject:(id)readOnlyObject readBlock:(void (^) (id innerReadOnlyObject)) readBlock;
+ (void) barrierAsyncWriteWithObject:(id)writableObject writeBlock:(void (^) (id innerWritableObject)) writeBlock;

@end
