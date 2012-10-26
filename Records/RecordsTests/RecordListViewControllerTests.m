//
//  RecordListViewControllerTests.m
//  Records
//
//  Created by smn on 10/24/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import "RecordListViewControllerTests.h"
#import "RecordListViewController.h"
#import "RecordViewController.h"
#import "Record.h"

@implementation RecordListViewControllerTests{
    RecordListViewController *controller;
    id record1;
    id record2;
}

- (void)setUp
{
    [super setUp];
    controller = [self instantiateStoryboardControllerWithIdentifier:@"Record List"];
    record1 = mock([Record class]);
    [given([record1 artistName]) willReturn:@"First Artist"];
    record2 = mock([Record class]);
    [given([record2 artistName]) willReturn:@"Second Artist"];
    controller.records = [NSArray arrayWithObjects:record1, record2, nil];
}

- (void)test_RecordListVC_existsInStoryboard
{
    STAssertNotNil(controller, nil);
}

- (void)test_RecordListVC_isTheVisibleController
{
    UINavigationController *navController = [self.storyboard instantiateInitialViewController];

    id contr = [navController visibleViewController];

    STAssertTrue([contr isKindOfClass:[RecordListViewController class]],
                 @"Presented View Controller should be of class RecordListViewController but was %@", [contr class]);
}

- (void)test_RecordListVC_hasATitle
{
    STAssertEqualObjects(@"Records", [[controller navigationItem] title], nil);
}

- (void)test_RecordListVC_hasATableView
{
    STAssertNotNil([controller tableView], nil);
}

- (void)test_RecordListVC_viewDidLoad_setsTheTableViewDataSource
{
    STAssertEquals(controller, controller.tableView.dataSource, nil);
}

- (void)test_RecordListVC_viewDidLoad_setsTheTableViewDelegate
{
    STAssertEquals(controller, controller.tableView.delegate, nil);
}

- (void)test_RecordListDS_seque_showsRecordVCWhenCellIsSelected
{
    [controller performSegueWithIdentifier:@"Show Record" sender:nil];
    
    RecordViewController *recordVC = (RecordViewController *) controller.navigationController.visibleViewController;
    
    STAssertTrue([recordVC isKindOfClass:[RecordViewController class]],
                 @"Presented View Controller should be of class RecordListViewController but was %@", [recordVC class]);
}

- (void)test_RecordListDS_segue_setsRecordForRecordVC
{
    UITableViewCell *cell;
    RecordViewController *recordVC;
    
    cell = [controller tableView:controller.tableView
           cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [controller performSegueWithIdentifier:@"Show Record" sender:cell];
    recordVC = (RecordViewController *) controller.navigationController.visibleViewController;
    
    STAssertEquals(record1, recordVC.record, nil);
    
    cell = [controller tableView:controller.tableView
           cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    [controller performSegueWithIdentifier:@"Show Record" sender:cell];
    recordVC = (RecordViewController *) controller.navigationController.visibleViewController;
    
    STAssertEquals(record2, recordVC.record, nil);
}


@end
