//
//  NSURLRequestHelper.h
//  HCOjbectiveCHelpers
//
//  Created by Aaron Hull on 6/16/14.
//  Copyright (c) 2014 Hull Computing. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kNSURLHTTPHeaderFieldContentType;
extern NSString *const kNSURLHTTPHeaderFieldAcceptVersion;
extern NSString *const kNSURLHTTPHeaderFieldContentLength;
extern NSString *const kNSURLHTTPHeaderKeyJSON;
extern NSString *const kNSURLHTTPHeaderKeyWWWFormURLEncoded;

extern NSString *const kNSURLHTTPMethodGet;
extern NSString *const kNSURLHTTPMethodPost;
extern NSString *const kNSURLHTTPMethodPut;
extern NSString *const kNSURLHTTPMethodDelete;

typedef NS_ENUM(NSInteger, NSURLRequestEnvironment) {
    NSURLRequestEnvironmentQA = 1,
    NSURLRequestEnvironmentProduction,
    NSURLRequestEnvironmentStaging
};

@interface NSURLRequestHelper : NSObject

/**
 Returns an NSURLRequest object formatted with the correct URL and headers for
 the Cobrain API and WebApp.
 
 @param method An NSString for the HTTP method to be used for the request.
 @param path The path relative to the base URL of either the webApp or the API.
 @param toAPI A boolean to determine if the request is for the API or the WebApp.
 @param withQuery A dictionary of key-value pairs representing any queries to be appended to the url. Can be nil.
 @param bodyData The HTTP body data to be used in the request. Can be nil.
 @param bodyIsJSON A boolean designating whether the body data is JSON or www-form-url-encoded.
 
 @returns An NSURLRequest object ready to be used in an NSURLConnection.
 
 */
+ (NSURLRequest *)requestWithHTTPMethod:(NSString *)method baseURLString:(NSString *)baseURLString forPath:(NSString *)path withHeaders:(NSDictionary *)headers withQuery:(NSDictionary *)query withBody:(id)bodyData bodyIsJSON:(BOOL)bodyIsJSON;

+ (NSURLRequestEnvironment)currentEnvironment;

+ (NSString *)webAppBaseURL;
+ (NSString *)apiBaseURL;

+ (NSString *)encodeToPercentEscapeString:(NSString *)string;
@end
