//
//  NSObject+Additions.h
//  Cobrain
//
//  Created by Aaron Hull on 2/11/14.
//  Copyright (c) 2014 Cobrain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (Additions)

@property (nonatomic, strong) NSMutableDictionary *observers;

- (NSArray *)getPropertyNames;
- (NSString *)prettyDescription;
- (NSDictionary *)removeUnknownPropertiesFromDictionary:(NSDictionary *)keyedValues;
- (NSDictionary *)dictionaryOfProperties;
- (void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options;
@end
