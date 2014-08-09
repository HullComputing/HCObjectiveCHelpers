//
//  UILabel+HCHelpers.m
//  Cobrain
//
//  Created by Aaron Hull on 4/14/14.
//  Copyright (c) 2014 Cobrain. All rights reserved.
//

#import "UILabel+HCHelpers.h"

@implementation UILabel (HCHelpers)

- (CGFloat)fontSizeForContent
{
    CGFloat fontSize = 0.0;
    CGFloat width = 0;
    CGFloat height = 0;
    if (self.text) {
        while (width < self.frame.size.width && height < self.frame.size.height) {
            fontSize += 0.5;
            CGSize size = [self.text sizeWithAttributes:@{NSFontAttributeName: [self.font fontWithSize:fontSize]}];
            width = size.width;
            height = size.height;
        }
    }
    return fontSize - (CGFloat)0.5;
}

@end
