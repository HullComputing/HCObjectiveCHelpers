//
//  NSDictionary+Additions.h
//  Cobrain
//
//  Created by Aaron Hull on 2/10/14.
//  Copyright (c) 2014 Cobrain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Additions)

- (NSMutableDictionary *)replaceKey:(NSString *)originalKey withKey:(NSString *)replacementKey;

- (NSMutableDictionary *)swapKey:(NSString *)oldKey forKey:(NSString *)replacementKey;
@end
