//
//  NSString+HCHelpers.h
//  Cobrain iOS Phoenix
//
//  Created by Aaron Hull on 6/6/14.
//  Copyright (c) 2014 Cobrain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSObject+HCHelpers.h"

@interface NSString (HCHelpers)

- (CGFloat)pointSizeForFont:(UIFont *)font inWidth:(CGFloat)width;
- (NSString *)stringByStrippingHTMLTags;

@end
