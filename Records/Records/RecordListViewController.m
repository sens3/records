//
//  RecordListViewController.m
//  Records
//
//  Created by smn on 10/24/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import "RecordListViewController.h"
#import "RecordViewController.h"
#import "Record.h"
#import "RecordCell.h"

@interface RecordListViewController ()

@end

@implementation RecordListViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        Record *duke = [[Record alloc] init];
        duke.artistName = @"Duke Ellington";
        Record *sonny = [[Record alloc] init];
        sonny.artistName = @"Sonny Rollins";
        _records = [NSArray arrayWithObjects:duke, sonny, nil];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - 
#pragma mark - UITableView Delegate and DataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_records count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Record Cell"];
    
    if (!cell) {
        cell = (RecordCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Record Cell"];
    }
    
    Record *record = [_records objectAtIndex:indexPath.row];
    cell.record = record;
    [cell.textLabel setText:record.artistName];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RecordCell *cell = (RecordCell *)sender;
    if ([segue.identifier isEqualToString:@"Show Record"]) {
        RecordViewController *recordVC = (RecordViewController *)[segue destinationViewController];
        recordVC.record = cell.record;
    }
}


@end
