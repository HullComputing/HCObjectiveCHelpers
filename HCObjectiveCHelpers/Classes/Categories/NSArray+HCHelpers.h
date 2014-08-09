//
//  NSArray+HCHelpers.h
//  Cobrain
//
//  Created by Aaron Hull on 3/17/14.
//  Copyright (c) 2014 Cobrain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (HCHelpers)

/**
 *  Compares two arrays, providing an array of objects from the array not found in the provided.
 *
 *  @param array  The array to compare to (may be nil)
 *
 *  @return An array of the unique objects from self that do not exist in the provided array.
 */
- (NSArray *)diffObjectsInArray:(NSArray *)array;

@end
