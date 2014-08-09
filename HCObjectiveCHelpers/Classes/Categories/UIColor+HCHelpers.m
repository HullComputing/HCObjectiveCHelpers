//
//  UIColor+HCHelpers.m
//  Cobrain
//
//  Created by Aaron Hull on 11/13/13.
//  Copyright (c) 2013 Cobrain. All rights reserved.
//

#import "UIColor+HCHelpers.h"

@implementation UIColor (HCHelpers)

- (UIColor *)lighterColorByPercent:(double)percent
{
    if (percent > 1.0) {
        percent = percent/100.0;
    }
    percent += 1;
    CGFloat h, s, b, a;
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a])
        return [UIColor colorWithHue:h
                          saturation:s
                          brightness:(CGFloat) MIN(b * percent, 1)
                               alpha:a];
    return nil;
}

- (UIColor *)darkerColor
{
    CGFloat h, s, b, a;
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a])
        return [UIColor colorWithHue:h
                          saturation:s
                          brightness:b * (CGFloat)0.75
                               alpha:a];
    return nil;
}
@end