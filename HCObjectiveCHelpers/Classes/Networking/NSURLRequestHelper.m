//
//  NSURLRequestHelper.m
//  HCOjbectiveCHelpers
//
//  Created by Aaron Hull on 6/16/14.
//  Copyright (c) 2014 Hull Computing. All rights reserved.
//

#import "NSURLRequestHelper.h"
#import "NSURL+HCHelpers.h"
#import "NSString+HCHelpers.h"

NSString *const kNSURLHTTPHeaderFieldContentType        = @"Content-Type";
NSString *const kNSURLHTTPHeaderFieldAcceptVersion      = @"Accept-Version";
NSString *const kNSURLHTTPHeaderFieldContentLength      = @"Content-Length";
NSString *const kNSURLHTTPHeaderKeyJSON                 = @"application/json";
NSString *const kNSURLHTTPHeaderKeyWWWFormURLEncoded    = @"applicartion/x-www-form-urlencoded";

NSString *const kNSURLHTTPMethodGet                     = @"GET";
NSString *const kNSURLHTTPMethodPost                    = @"POST";
NSString *const kNSURLHTTPMethodPut                     = @"PUT";
NSString *const kNSURLHTTPMethodDelete                  = @"DELETE";

@implementation NSURLRequestHelper

+ (NSURLRequest *)requestWithHTTPMethod:(NSString *)method baseURLString:(NSString *)baseURLString forPath:(NSString *)path withHeaders:(NSDictionary *)headers withQuery:(NSDictionary *)query withBody:(id)bodyData bodyIsJSON:(BOOL)bodyIsJSON
{
    if  ([self httpMethodIsValid:method] && [baseURLString isValidString]) {
        NSURL *url = [[NSURL alloc] initWithString:baseURLString];
       
        if ([path isValidString]) {
            NSArray *pathWithQueryArray = [path componentsSeparatedByString:@"?"];
            if ([pathWithQueryArray isKindOfClass:[NSArray class]] && pathWithQueryArray.count == 2) {
                NSString *addonQueryString = [pathWithQueryArray lastObject];
                NSArray *addonQueryArray = [addonQueryString componentsSeparatedByString:@"&"];
                NSMutableDictionary *updatedQuery = [NSMutableDictionary dictionaryWithDictionary:query];
                for (NSString *singleAddonQuery in addonQueryArray) {
                    NSArray *singleQueryArray = [singleAddonQuery componentsSeparatedByString:@"="];
                    if ([singleQueryArray isKindOfClass:[NSArray class]] && singleQueryArray.count == 2) {
                        [updatedQuery setObject:[singleQueryArray lastObject] forKey:[singleQueryArray firstObject]];
                    }
                }
                query = [updatedQuery copy];
                path = [pathWithQueryArray firstObject];
            }
            
            
            url = [url URLByAppendingPathComponent:path];
            
        }
        
        if ([query isKindOfClass:[NSDictionary class]] && query.count) {
            url = [url URLByAppendingQueryDictionary:query];
        }
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        
        if ([headers isKindOfClass:[NSDictionary class]] && headers.count) {
            [request setAllHTTPHeaderFields:headers];
        }
        
        [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        [request setTimeoutInterval:30.0];
        [request setHTTPMethod:method];
         NSData *postData = bodyData;
        if ([bodyData isKindOfClass:[NSDictionary class]] && [(NSDictionary *)bodyData count]) {
            if (bodyIsJSON) {
                postData = [NSJSONSerialization dataWithJSONObject:bodyData options:0 error:nil];
            } else {
                NSLog(@"Need method for NSDictionary to NSData");
            }
        } else if ([bodyData isKindOfClass:[NSString class]]) {
            postData = [(NSString *)bodyData dataUsingEncoding:NSUTF8StringEncoding];
        } 
        
        if (postData) {
            [request setHTTPBody:postData];
            [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[postData length]] forHTTPHeaderField:kNSURLHTTPHeaderFieldContentLength];
        
            [request setValue:bodyIsJSON ? kNSURLHTTPHeaderKeyJSON : kNSURLHTTPHeaderKeyWWWFormURLEncoded forHTTPHeaderField:kNSURLHTTPHeaderFieldContentType];
        }
        
//        [request setValue:[NSString stringWithFormat:@"ios, %@, %@", [[UIDevice currentDevice] systemVersion], ([[UIDevice currentDevice] respondsToSelector: @selector(userInterfaceIdiom)] && [UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad ? @"tablet" : @"phone")] forHTTPHeaderField:@"X-Cobrain-Client"];
        
        return [request copy];
    }
    return nil;
}

+ (NSString *)encodeToPercentEscapeString:(NSString *)string
{
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef) string, NULL, (__bridge CFStringRef) @":/?#[]@!$&'()*+,;=", kCFStringEncodingUTF8));
}


+ (NSURLRequestEnvironment)currentEnvironment
{
    return NSURLRequestEnvironmentQA;
}

+ (NSString *)webAppBaseURL
{
    return nil;
}

+ (NSString *)apiBaseURL
{
    return nil;
}

+ (BOOL)httpMethodIsValid:(NSString *)httpMethod
{
    BOOL valid = NO;
    if ([httpMethod isValidString]) {
        valid = [httpMethod isEqualToString:kNSURLHTTPMethodGet] || [httpMethod isEqualToString:kNSURLHTTPMethodPost] || [httpMethod isEqualToString:kNSURLHTTPMethodPut] || [httpMethod isEqualToString:kNSURLHTTPMethodDelete];
    }
    return valid;
}


@end
