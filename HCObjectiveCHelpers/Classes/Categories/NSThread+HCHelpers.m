//
//  NSThread+HCHelpers.m
//  cobrain-ios-phoenix
//
//  Created by Aaron Hull on 6/12/14.
//  Copyright (c) 2014 Cobrain. All rights reserved.
//

#import "NSThread+HCHelpers.h"


@implementation NSThread (HCHelpers)
- (void)performBlock:(void (^)())block
{
    if ([[NSThread currentThread] isEqual:self])
        block();
    else
        [self performBlock:block waitUntilDone:NO];
}
- (void)performBlock:(void (^)())block waitUntilDone:(BOOL)wait
{
    [NSThread performSelector:@selector(ng_runBlock:)
                     onThread:self
                   withObject:[block copy]
                waitUntilDone:wait];
}
+ (void)ng_runBlock:(void (^)())block
{
    block();
}
+ (void)performBlockInBackground:(void (^)())block{
#ifdef __IPHONE_4_0
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        block();
    });
#else
    [NSThread performSelectorInBackground:@selector(ng_runBlock:)
                               withObject:[[block copy] autorelease]];
#endif
}

+ (void)performBlockOnMainThread:(void (^)())block{
#ifdef __IPHONE_4_0
    dispatch_async(dispatch_get_main_queue(), ^{
        block();
    });
#else
    [NSThread performSelectorOnMainThread:@selector(ng_runBlock:)
                               withObject:[block copy]];
#endif
}

@end
