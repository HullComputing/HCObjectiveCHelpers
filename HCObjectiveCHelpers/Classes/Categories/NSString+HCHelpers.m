//
//  NSString+HCHelpers.m
//  Cobrain iOS Phoenix
//
//  Created by Aaron Hull on 6/6/14.
//  Copyright (c) 2014 Cobrain. All rights reserved.
//

#import "NSString+HCHelpers.h"

@implementation NSString (HCHelpers)

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

- (NSString *)stringByStrippingHTMLTags
{
    NSRange range;
    NSString *finalString = [self copy];
    while ((range = [finalString rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        finalString = [finalString stringByReplacingCharactersInRange:range withString:@""];
    return finalString;
}

@end
