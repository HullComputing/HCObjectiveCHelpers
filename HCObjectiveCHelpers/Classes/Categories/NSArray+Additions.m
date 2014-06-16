//
//  NSArray+Additions.m
//  Cobrain
//
//  Created by Aaron Hull on 3/17/14.
//  Copyright (c) 2014 Cobrain. All rights reserved.
//

#import "NSArray+Additions.h"

@implementation NSArray (Additions)

+ (NSArray *)compareObjectsInArray:(NSArray *)firstArray withArray:(NSArray *)secondArray
{
    if (!secondArray && firstArray) {
        return firstArray;
    }
    if (!firstArray) {
        return nil;
    }
    NSMutableArray *missingObjects = [[NSMutableArray alloc] initWithCapacity:firstArray.count];
    for (id object in firstArray) {
        if (![secondArray containsObject:object]) {
            [missingObjects addObject:object];
        }
    }
    if (missingObjects.count) {
        return missingObjects;
    }
    return nil;
}

@end
