//
//  FHSyncDataRecordTest.m
//  fh-ios-sdk
//
//  Copyright (c) 2012-2015 FeedHenry. All rights reserved.
//

#import "FHSyncDataRecord.h"
#import "FHJSON.h"
#import "FHTestUtils.h"
#import <XCTest/XCTest.h>

@interface FHSyncDataRecordTest : XCTestCase

@end

@implementation FHSyncDataRecordTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testSerializtionAndDeserialization {
    NSDictionary *data = [FHTestUtils generateJSONData];

    FHSyncDataRecord *record = [[FHSyncDataRecord alloc] initWithData:data];
    XCTAssertNotNil(record.hashValue, @"Hashvalue should not be nil");
    XCTAssertNotNil(record.data, @"data should not be nil");

    NSString *jsonStr = [record JSONString];
    NSLog(@"record = %@", jsonStr);

    FHSyncDataRecord *anotherRecord = [FHSyncDataRecord objectFromJSONString:jsonStr];
    XCTAssertEqualObjects(record, anotherRecord, @"Two records should be the same");
}

@end
