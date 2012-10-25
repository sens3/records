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
#import "Record.h"

@implementation RecordListDelegateAndDataSourceTests {
    RecordListViewController *controller;
}

- (void)setUp
{
    [super setUp];
    controller = [self instantiateStoryboardControllerWithIdentifier:@"Record List"];
    id record1 = mock([Record class]);
    [given([record1 artistName]) willReturn:@"First Artist"];
    id record2 = mock([Record class]);
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

- (void)test_RecordListDS_setsTheCellTextLabel
{
    UITableViewCell *cell;
    
    cell = [controller tableView:controller.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    STAssertEqualObjects(@"First Artist", cell.textLabel.text, nil);
    
    cell = [controller tableView:controller.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    
    STAssertEqualObjects(@"Second Artist", cell.textLabel.text, nil);
}

- (void)test_RecordListDS_seque_showsRecordVCWhenCellIsSelected
{
    [controller performSegueWithIdentifier:@"Show Record" sender:nil];
    
    RecordViewController *recordVC = (RecordViewController *) controller.navigationController.visibleViewController;
    
    STAssertTrue([recordVC isKindOfClass:[RecordViewController class]],
                 @"Presented View Controller should be of class RecordListViewController but was %@", [recordVC class]);
}

- (void)test_RecordListDS_segue_setsArtistNameForRecordVC
{
    UITableViewCell *cell;
    RecordViewController *recordVC;
    
    cell = [controller tableView:controller.tableView
           cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [controller performSegueWithIdentifier:@"Show Record" sender:cell];
    recordVC = (RecordViewController *) controller.navigationController.visibleViewController;
    
    STAssertEqualObjects(@"First Artist", recordVC.artistName, nil);
    
    cell = [controller tableView:controller.tableView
           cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    [controller performSegueWithIdentifier:@"Show Record" sender:cell];
    recordVC = (RecordViewController *) controller.navigationController.visibleViewController;
    
    STAssertEqualObjects(@"Second Artist", recordVC.artistName, nil);
}


@end
