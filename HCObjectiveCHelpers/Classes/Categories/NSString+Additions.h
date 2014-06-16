//
//  NSString+Additions.h
//  Cobrain iOS Phoenix
//
//  Created by Aaron Hull on 6/6/14.
//  Copyright (c) 2014 Cobrain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Additions)

- (CGFloat)pointSizeForFont:(UIFont *)font inWidth:(CGFloat)width;

- (BOOL)isValidString;
@end
