//
//  NSURL+Additions.h
//  Cobrain
//
//  Created by Aaron Hull on 2/12/14.
//  Copyright (c) 2014 Cobrain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Additions)

- (NSURL *)URLByAppendingQueryDictionary:(NSDictionary *)query;

@end
