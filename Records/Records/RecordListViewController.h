//
//  RecordListViewController.h
//  Records
//
//  Created by smn on 10/24/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RecordListDataSource;

@interface RecordListViewController : UITableViewController

@property (nonatomic, strong) NSArray *records;

@end
