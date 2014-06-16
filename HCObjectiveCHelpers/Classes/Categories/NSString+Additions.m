//
//  NSString+Additions.m
//  Cobrain iOS Phoenix
//
//  Created by Aaron Hull on 6/6/14.
//  Copyright (c) 2014 Cobrain. All rights reserved.
//

#import "NSString+Additions.h"

@implementation NSString (Additions)

- (CGFloat)pointSizeForFont:(UIFont *)font inWidth:(CGFloat)width
{
    CGFloat pointSize = 0.5;
    if (font && width) {
        while (width > [self sizeWithAttributes:@{NSFontAttributeName:[font fontWithSize:pointSize]}].width) {
            pointSize += 0.5;
        }
    }
    
    return pointSize;
}

- (BOOL)isValidString
{
    return ([self isKindOfClass:[NSString class]] && ![[self stringByReplacingOccurrencesOfString:@" " withString:@""] isEqualToString:@""]);
}

@end
