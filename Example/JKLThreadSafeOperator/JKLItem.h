//
//  JKLItem.h
//  JKLThreadSafeOperator
//
//  Created by jiakai lian on 3/12/2015.
//  Copyright © 2015 Jiakai Lian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKLItem : NSObject

@property(nonatomic, copy) NSArray *subItems;

- (void)addsubItem:(NSString *)string;

@end
