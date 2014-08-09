//
//  UIButton+HCHelpers.h
//  Cobrain
//
//  Created by Aaron Hull on 4/9/14.
//  Copyright (c) 2014 Cobrain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (HCHelpers)

- (void)changeAction:(SEL)action forTarget:(id)aTarget forControlEvent:(UIControlEvents)controlEvent;

@end
