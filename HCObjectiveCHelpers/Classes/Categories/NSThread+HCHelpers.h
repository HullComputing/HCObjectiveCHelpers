//
//  NSThread+HCHelpers.h
//  cobrain-ios-phoenix
//
//  Created by Aaron Hull on 6/12/14.
//  Copyright (c) 2014 Cobrain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSThread (HCHelpers)
- (void)performBlock:(void (^)())block;
- (void)performBlock:(void (^)())block waitUntilDone:(BOOL)wait;
+ (void)performBlockInBackground:(void (^)())block;
+ (void)performBlockOnMainThread:(void (^)())block;

@end