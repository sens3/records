//
//  RecordListDelegateAndDataSourceTests.m
//  Records
//
//  Created by smn on 10/24/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import "RecordListDelegateAndDataSourceTests.h"
#import "RecordListViewController.h"
#import "RecordViewController.h"
#import "RecordCell.h"
#import "Record.h"

@implementation RecordListDelegateAndDataSourceTests {
    RecordListViewController *controller;
    id record1;
    id record2;
}

- (void)setUp
{
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    controller = [storyboard instantiateViewControllerWithIdentifier:@"Record List"];
    record1 = mock([Record class]);
    [given([record1 artistName]) willReturn:@"First Artist"];
    record2 = mock([Record class]);
    [given([record2 artistName]) willReturn:@"Second Artist"];
    controller.records = [NSArray arrayWithObjects:record1, record2, nil];
}

- (void)test_RecordListDS_hasAnArrayOfRecords
{
    STAssertNotNil(controller.records, nil);
}

- (void)test_RecordListDS_returnsTheNumberOfRows
{
    NSInteger actual = [controller tableView:controller.tableView numberOfRowsInSection:0];
     
    STAssertEquals(2, actual, nil);
}

- (void)test_RecordListDS_returnsARecordCell
{
    UITableViewCell *cell = [controller tableView:controller.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    STAssertNotNil(cell, nil);
    STAssertEqualObjects(@"Record Cell", cell.reuseIdentifier, nil);
}

- (void)test_RecordListDS_setsTheCellRecord
{
    RecordCell *cell;
    
    cell = (RecordCell *)[controller tableView:controller.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    STAssertEqualObjects(record1, cell.record, nil);
    
    cell = (RecordCell *)[controller tableView:controller.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    
    STAssertEqualObjects(record2, cell.record, nil);
}


@end
