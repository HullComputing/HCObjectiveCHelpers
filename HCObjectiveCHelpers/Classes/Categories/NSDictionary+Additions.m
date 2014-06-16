//
//  NSDictionary+Additions.m
//  Cobrain
//
//  Created by Aaron Hull on 2/10/14.
//  Copyright (c) 2014 Cobrain. All rights reserved.
//

#import "NSDictionary+Additions.h"

@implementation NSDictionary (Additions)

- (NSMutableDictionary *)replaceKey:(NSString *)originalKey withKey:(NSString *)replacementKey
{
    NSMutableDictionary *mDictionary = [NSMutableDictionary dictionaryWithDictionary:self];
    id value = [mDictionary objectForKey:originalKey];
    if (value && ![value isEqual:[NSNull null]]) {
        [mDictionary setObject:value forKey:replacementKey];
        [mDictionary removeObjectForKey:originalKey];
    }
    return mDictionary;
}

- (NSMutableDictionary *)swapKey:(NSString *)oldKey forKey:(NSString *)replacementKey
{
    NSMutableDictionary *resultDictionary = [NSMutableDictionary dictionaryWithDictionary:self];
    NSArray *keys = [resultDictionary allKeys];
    NSMutableDictionary *replacementKeyDictionary = [[NSMutableDictionary alloc] initWithCapacity:keys.count];
    
    if (![keys containsObject:oldKey]) {
        if ([keys containsObject:replacementKey]) {
            [replacementKeyDictionary setObject:replacementKey forKey:oldKey];
        }
    }
    for (NSString *key in replacementKeyDictionary.allKeys) {
        resultDictionary = [resultDictionary replaceKey:key withKey:[replacementKeyDictionary objectForKey:key]];
    }
    return resultDictionary;
}

@end
