//
//  NSArray+HCHelpers.m
//  Cobrain
//
//  Created by Aaron Hull on 3/17/14.
//  Copyright (c) 2014 Cobrain. All rights reserved.
//

#import "NSArray+HCHelpers.h"

@implementation NSArray (HCHelpers)

- (NSArray *)diffObjectsInArray:(NSArray *)array;
{
    if (!array && [self isKindOfClass:[NSArray class]]) {
        return [NSArray arrayWithArray:self];
    }
    if (![self isKindOfClass:[NSArray class]] && [array isKindOfClass:[NSArray class]]) {
        return [NSArray arrayWithArray:array];
    }
    NSMutableArray *missingObjects = [[NSMutableArray alloc] initWithCapacity:self.count];
    for (id object in self) {
        if (![array containsObject:object]) {
            [missingObjects addObject:object];
        }
    }

    return [missingObjects copy];
}

@end
