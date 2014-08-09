//
//  NSURL+HCHelpers.m
//  Cobrain
//
//  Created by Aaron Hull on 2/12/14.
//  Copyright (c) 2014 Cobrain. All rights reserved.
//

#import "NSURL+HCHelpers.h"

@implementation NSURL (HCHelpers)

- (NSURL *)URLByAppendingQueryDictionary:(NSDictionary *)query
{
    NSString *urlString = [self absoluteString];
    urlString = [NSString localizedStringWithFormat:@"%@", [urlString stringByAppendingString:@"?"]];
    NSMutableArray *queryArray = [[NSMutableArray alloc] initWithCapacity:query.count];
    for (NSString *key in query) {
        [queryArray addObject:[NSString stringWithFormat:@"%@=%@", key, [query objectForKey:key]]];
    }
    urlString = [urlString stringByAppendingString:[queryArray componentsJoinedByString:@"&"]];
    return [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
}

@end
