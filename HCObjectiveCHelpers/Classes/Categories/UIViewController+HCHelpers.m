//
//  UIViewController+HCHelpers.m
//  Cobrain
//
//  Created by Aaron Hull on 4/3/14.
//  Copyright (c) 2014 Cobrain. All rights reserved.
//

#import "UIViewController+HCHelpers.h"

@implementation UIViewController (HCHelpers)

- (void)removeAllChildViewControllers
{
    if (self.childViewControllers.count) {
        for (UIViewController *viewController in self.childViewControllers) {
            [viewController removeAllChildViewControllers];
            [viewController willMoveToParentViewController:nil];
            [viewController.view removeFromSuperview];
            [viewController removeFromParentViewController];
            [viewController didMoveToParentViewController:nil];
        }
    }
}

@end
