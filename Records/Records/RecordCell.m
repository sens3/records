//
//  RecordCell.m
//  Records
//
//  Created by smn on 10/26/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import "RecordCell.h"
#import "Record.h"

@implementation RecordCell

- (id)initWithRecord:(Record *)r
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Record Cell"];
    
    if (self) {
        _record = r;
        [self.textLabel setText:_record.artistName];
        self.accessibilityLabel = _record.artistName;
    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
