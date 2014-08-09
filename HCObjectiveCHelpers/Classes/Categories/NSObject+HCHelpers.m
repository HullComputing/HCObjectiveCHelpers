//
//  NSObject+HCHelpers.m
//  Cobrain
//
//  Created by Aaron Hull on 2/11/14.
//  Copyright (c) 2014 Cobrain. All rights reserved.
//

#import "NSObject+HCHelpers.h"
#import <objc/runtime.h>

@implementation NSObject (HCHelpers)
@dynamic observers;

- (NSArray *)getPropertyNames
{
    NSMutableArray *propertyNames = [[NSMutableArray alloc] init];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for(i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if(propName) {
            //            const char *propType = getPropertyType(property);
            NSString *propertyName = [NSString stringWithCString:propName
                                                        encoding:[NSString defaultCStringEncoding]];
            //            NSString *propertyType = [NSString stringWithCString:propType
            //                                                        encoding:[NSString defaultCStringEncoding]];
            
            [propertyNames addObject:propertyName];
        }
    }
    free(properties);
    return [propertyNames copy];
}

- (NSString *)prettyDescription
{
    NSMutableString* string = [NSMutableString stringWithString:@""];
    unsigned int propertyCount;
    objc_property_t* properties = class_copyPropertyList([self class], &propertyCount);
    
    for(unsigned int i = 0; i < propertyCount; i++) {
        NSString *selector = [NSString stringWithCString:property_getName(properties[i]) encoding:NSUTF8StringEncoding] ;
        
        SEL sel = sel_registerName([selector UTF8String]);
        IMP imp = [self methodForSelector:sel];
        id (*function)(id, SEL) = (void *)imp;
        
        NSInteger (*integerFunction)(id, SEL) = (void *)imp;
        NSInteger integerResult = integerFunction(self, sel);
        
        CGFloat (*floatFunction)(id, SEL) = (void *)imp;
        CGFloat floatResult = floatFunction(self, sel);
        
        
        
        const char* attr = property_getAttributes(properties[i]);
        switch (attr[1]) {
            case '@':
                [string appendString:[NSString stringWithFormat:@"%s : %@\r", property_getName(properties[i]), function(self, sel)]];
                break;
            case 'i':
                [string appendString:[NSString stringWithFormat:@"%s : %li\r", property_getName(properties[i]), (long)integerResult]];
                break;
            case 'f':
                
                [string appendString:[NSString stringWithFormat:@"%s : %f\r", property_getName(properties[i]), floatResult]];
                break;
            default:
                break;
        }
    }
    free(properties);
    NSString *finalString = [NSString stringWithString:string];
    finalString = [finalString stringByReplacingOccurrencesOfString:@"\n" withString:@"\r    "];
    finalString = [finalString stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    return finalString;
    
}

- (NSDictionary *)removeUnknownPropertiesFromDictionary:(NSDictionary *)keyedValues
{
    NSMutableDictionary *mutableValues = [NSMutableDictionary dictionaryWithCapacity:keyedValues.count];
    NSArray *propertyNames = [self getPropertyNames];
    for (NSString *key in keyedValues.allKeys) {
        if ([propertyNames containsObject:key]) {
            [mutableValues setObject:[keyedValues objectForKey:key] forKey:key];
        }
    }
    return [mutableValues copy];
    
}

- (NSDictionary *)dictionaryOfProperties
{
    NSArray *propertyNames = [self getPropertyNames];
    return [self dictionaryWithValuesForKeys:propertyNames];
}


- (void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options
{
    if (!self.observers) {
        self.observers = [[NSMutableDictionary alloc] init];
    }
    NSMutableArray *observersArray = [NSMutableArray arrayWithArray:[self.observers objectForKey:keyPath]];
    if ([observersArray isKindOfClass:[NSMutableArray class]]) {
        if (![observersArray containsObject:observer]) {
            [observersArray addObject:observer];
            [self addObserver:observer forKeyPath:keyPath options:options context:nil];
        }
    } else {
        observersArray = [[NSMutableArray alloc] initWithArray:@[observer]];
        [self addObserver:observer forKeyPath:keyPath options:options context:nil];
    }
    [self.observers setObject:observersArray forKey:keyPath];
}

- (BOOL)isValidString
{
    return ([self isKindOfClass:[NSString class]] && ![[(NSString *)self stringByReplacingOccurrencesOfString:@" " withString:@""] isEqualToString:@""]);
}


@end
