//
//  RecordTests.m
//  Records
//
//  Created by smn on 10/26/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import "RecordTests.h"
#import "Record.h"

@implementation RecordTests {
    Record *record;
}

- (void)setUp
{
    record = [[Record alloc] init];
}

- (void)test_Record_exists
{
    STAssertNotNil(record, nil);
}

- (void)test_Record_hasAnArtistName
{
    STAssertTrue([record respondsToSelector:@selector(artistName)], nil);
    STAssertTrue([record respondsToSelector:@selector(setArtistName:)], nil);
}

- (void)test_Record_hasATitle
{
    STAssertTrue([record respondsToSelector:@selector(title)], nil);
    STAssertTrue([record respondsToSelector:@selector(setTitle:)], nil);
}

- (void)test_Record_hasADiscogsURL
{
    STAssertTrue([record respondsToSelector:@selector(discogsURL)], nil);
    STAssertTrue([record respondsToSelector:@selector(setDiscogsURL:)], nil);
}

@end
