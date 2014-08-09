//
//  UIImage+HCHelpers.m
//  Cobrain
//
//  Created by Aaron Hull on 4/1/14.
//  Copyright (c) 2014 Cobrain. All rights reserved.
//

#import "UIImage+HCHelpers.h"

@implementation UIImage (HCHelpers)

+ (UIImage *)imageWithoutCacheNamed:(NSString *)filename
{
    UIImage *image = nil;
    NSArray *pathArray = [filename pathComponents];
    if (pathArray.count > 1) {
        if ([[NSFileManager defaultManager] isReadableFileAtPath:filename]) {
            @try {
                image = [UIImage imageWithContentsOfFile:filename];
            }
            @catch (NSException *exception) {
                image = nil;
            }
        }
    } else {
        image = [UIImage imageNamed:filename];
    }
//    DLog(@"%@", filename);
//    if ([[NSFileManager defaultManager] fileExistsAtPath:filename]) {
//        return [UIImage imageNamed:filename];
//    } else {
//        return nil;
//    }
//
//        
//    UIImage *image = nil;
//    if ([filename isKindOfClass:[NSString class]]) {
//        NSString *imagePath = [[NSString alloc] initWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], filename];
//        if ([[NSFileManager defaultManager] fileExistsAtPath:imagePath]) {
//            image = [[UIImage alloc] initWithContentsOfFile:imagePath];
//        }
//        imagePath = nil;
//
    return image;
    
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
