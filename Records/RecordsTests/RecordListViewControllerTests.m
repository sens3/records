//
//  RecordListViewControllerTests.m
//  Records
//
//  Created by smn on 10/24/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import "RecordListViewControllerTests.h"
#import "RecordListViewController.h"

@implementation RecordListViewControllerTests{
    RecordListViewController *controller;
}

- (void)setUp
{
    [super setUp];
    controller = [self instantiateStoryboardControllerWithIdentifier:@"Record List"];
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


@end
