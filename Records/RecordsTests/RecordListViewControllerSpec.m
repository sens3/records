//
//  RecordListViewControllerSpec.m
//  Records
//
//  Created by smn on 10/25/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import "SpectaTestCase.h"
#import "RecordListViewController.h"
#import "RecordViewController.h"
#import "Record.h"
#import "RecordCell.h"

SpecBegin(RecordListViewController)

describe(@"RecordListViewController", ^{

    __block RecordListViewController *controller;
    __block UINavigationController *navController;
    __block id record1;
    __block id record2;
    
    before(^{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        controller = [storyboard instantiateViewControllerWithIdentifier:@"Record List"];
        navController = [[UINavigationController alloc] init];
        [navController pushViewController:controller animated:NO];
        
        record1 = mock([Record class]);
        [given([record1 artistName]) willReturn:@"First Artist"];
        record2 = mock([Record class]);
        [given([record2 artistName]) willReturn:@"Second Artist"];
        controller.records = [NSArray arrayWithObjects:record1, record2, nil];
        
        [controller loadView];
    });
    
    it(@"exists in storyboard", ^{
        expect(controller).notTo.beNil();
    });
    
    it(@"is the first visible controller", ^{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        UINavigationController *initialController = [storyboard instantiateInitialViewController];
        id contr = [initialController visibleViewController];
        
        expect(contr).to.beInstanceOf([RecordListViewController class]);
    });
    
    it(@"has a title", ^{
        expect(controller.navigationItem.title).to.equal(@"Records");
    });
    
    it(@"has a table view", ^{
        expect(controller.tableView).notTo.beNil();
    });
    
    describe(@"viewDidLoad", ^{
        
        it(@"sets the table view data source", ^{
            expect(controller.tableView.dataSource).to.equal(controller);
        });
        
        it(@"sets the table view delegate", ^{
            expect(controller.tableView.delegate).to.equal(controller);
        });
        
    });
    
    describe(@"as the table view delegate/data source", ^{
        
        it(@"has an array of records", ^{
            expect(controller.records).notTo.beNil();
        });
        
        it(@"returns the number of rows", ^{
            NSInteger actual = [controller tableView:controller.tableView numberOfRowsInSection:0];
            expect(actual).to.equal(2);
        });
        
        describe(@"cellForRowAtIndexPath", ^{
           
            it(@"returns a record cell", ^{
                RecordCell *cell = (RecordCell *)[controller tableView:controller.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
                expect(cell).notTo.beNil();
                
                expect(cell.reuseIdentifier).to.equal(@"Record Cell");
                
            });
            
            it(@"sets the record for the cell", ^{
                RecordCell *cell;
                
                cell = (RecordCell *)[controller tableView:controller.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
                
                expect(cell.record).to.equal(record1);
                
                cell = (RecordCell *)[controller tableView:controller.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
                
                expect(cell.record).to.equal(record2);
            });
            
        });
        
    });
    
    describe(@"perform seque", ^{
        
        it(@"shows RecordViewController on \"Show Record\" segue", ^{
            [controller performSegueWithIdentifier:@"Show Record" sender:nil];
            
            RecordViewController *recordVC = (RecordViewController *) controller.navigationController.visibleViewController;
            
            expect(recordVC).to.beInstanceOf([RecordViewController class]);
        });
        
        it(@"sets record for RecordViewController", ^{
            UITableViewCell *cell;
            RecordViewController *recordVC;
            
            cell = [controller tableView:controller.tableView
                   cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
            [controller performSegueWithIdentifier:@"Show Record" sender:cell];
            recordVC = (RecordViewController *) controller.navigationController.visibleViewController;
            
            expect(recordVC.record).to.equal(record1);
            
            cell = [controller tableView:controller.tableView
                   cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
            [controller performSegueWithIdentifier:@"Show Record" sender:cell];
            recordVC = (RecordViewController *) controller.navigationController.visibleViewController;
            
            expect(recordVC.record).to.equal(record2);
            
        });
        
    });
    
});

SpecEnd
