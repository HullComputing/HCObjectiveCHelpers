//
//  UIButton+Additions.m
//  Cobrain
//
//  Created by Aaron Hull on 4/9/14.
//  Copyright (c) 2014 Cobrain. All rights reserved.
//

#import "UIButton+Additions.h"

@implementation UIButton (Additions)

- (void)changeAction:(SEL)action forTarget:(id)aTarget forControlEvent:(UIControlEvents)controlEvent
{
    NSArray *actions = [self actionsForTarget:aTarget forControlEvent:controlEvent];
    if (actions) {
        for (NSString *oldAction in actions) {
            [self removeTarget:aTarget action:NSSelectorFromString(oldAction) forControlEvents:controlEvent];
        }
    }
    [self addTarget:aTarget action:action forControlEvents:controlEvent];
}

@end
