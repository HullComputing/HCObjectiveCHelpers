//
//  NSArrayTest.m
//  HCObjectiveCHelpers
//
//  Test cases for NSArrayTest
//
//  Created by Aaron Hull on 6/17/14.
//  Copyright (c) 2014 Hull Computing. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+HCHelpers.h"



@interface NSArrayTest : XCTestCase {
	NSArray *sut;
    NSArray *comparisonArray;
    NSArray *result;
}

@end

@implementation NSArrayTest

- (void)setUp {
    
    sut = [[NSArray alloc] initWithObjects:@(1), @(2), @(3), @(4), nil];
    
}

- (void)tearDown {
    
    sut = nil;
    [super tearDown];
    
}

- (void)testInitNotNil {
    
    XCTAssertNotNil(sut, @"Test NSArray object not instantiated");
}

- (void)testComparingANilArrayReturnsACopyOfTheFirstArray
{
    comparisonArray = nil;
    result = [sut diffObjectsInArray:comparisonArray];
    XCTAssertTrue([result isEqualToArray:sut], @"The resulting array after using diff on a nil array should be a copy of the original array.");
    XCTAssertFalse(sut == result, @"The resulting array should not be the original array but a copy. %@\n%@", sut, result);
}

- (void)testDiffReturnsCorrectObjects
{
    comparisonArray = @[@(1), @(3), @(5)];
    result = [sut diffObjectsInArray:comparisonArray];
    XCTAssertTrue([result isEqualToArray:(@[@(2), @(4)])], @"The resulting array should contain the missing objects only.");
}

- (void)testDiffReturnsEmptyArrayWhenComparingArraysWithTheSameObjects
{
    comparisonArray = [NSArray arrayWithArray:sut];
    XCTAssertTrue(sut != comparisonArray && [sut isEqualToArray:comparisonArray], @"The two arrays should contain the same objects but not be the same array.");
    result = [sut diffObjectsInArray:comparisonArray];
    XCTAssertNotNil(result, @"The result of diffing two arrays with the same objects should not be nil");
    XCTAssertTrue([result isKindOfClass:[NSArray class]], @"The result of diffing two arrays with the same objects should be an array");
    XCTAssertFalse([result isKindOfClass:[NSMutableArray class]], @"The result of diffing two arrays with the same objects should not be a mutable array");
    XCTAssertTrue(result.count == 0, @"The result of diffing two arrays with the same objects should be an empty array");
}


@end
