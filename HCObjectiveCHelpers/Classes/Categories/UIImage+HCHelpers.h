//
//  UIImage+HCHelpers.h
//  Cobrain
//
//  Created by Aaron Hull on 4/1/14.
//  Copyright (c) 2014 Cobrain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HCHelpers)
+ (UIImage *)imageWithoutCacheNamed:(NSString *)filename;
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

@end
