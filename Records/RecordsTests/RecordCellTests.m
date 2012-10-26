//
//  RecordCellTests.m
//  Records
//
//  Created by smn on 10/26/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import "RecordCellTests.h"
#import "RecordCell.h"
#import "Record.h"

@implementation RecordCellTests{
    id record;
}

- (void)setUp
{
    record = mock([Record class]);
    [given([record artistName]) willReturn:@"Miles Davis"];
}

- (void)test_RecordCell_initWithRecord_assignsTheRecord
{
    RecordCell *cell = [[RecordCell alloc] initWithRecord:record];
    STAssertEquals(cell.record, record, nil);
}

- (void)test_RecordCell_initWithRecord_setsTheTitleFromRecordArtistName
{
    RecordCell *cell = [[RecordCell alloc] initWithRecord:record];
    STAssertEqualObjects(cell.textLabel.text, @"Miles Davis", nil);
}

@end
