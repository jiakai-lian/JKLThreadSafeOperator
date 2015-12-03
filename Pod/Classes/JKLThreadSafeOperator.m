//
//  JKLThreadSafeOperator.m
//  Pods
//
//  Created by jiakai lian on 3/12/2015.
//
//

#import "JKLThreadSafeOperator.h"

@implementation JKLThreadSafeOperator

#pragma mark - Public Mehtods
+ (void)syncReadWithObject:(id)object readBlock:(void (^)(id object))readBlock {
  dispatch_queue_t queue = [self queueForClass:[object class]];
  dispatch_sync(queue, ^{
    readBlock(object);
  });
}

+ (void)barrierAsyncWriteWithObject:(id)object
                         writeBlock:(void (^)(id object))writeBlock {
  dispatch_queue_t queue = [self queueForClass:[object class]];
  dispatch_barrier_async(queue, ^{
    writeBlock(object);
  });
}

#pragma mark - cache for queues

+ (dispatch_queue_t)queueForClass:(Class) class {

  NSCache *queueCache = [self queueCache];

  @synchronized(class) {
    if ([queueCache objectForKey:class]) {
      return [queueCache objectForKey:class];
    } else {

      dispatch_queue_t queue = dispatch_queue_create(
          [NSStringFromClass(class) UTF8String], DISPATCH_QUEUE_CONCURRENT);
      [queueCache setObject:queue forKey:class];
      return queue;
    }
  }
}

    + (NSCache *)queueCache {
  static NSCache *_queueCache = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _queueCache = [[NSCache alloc] init];
  });

  return _queueCache;
}

@end
