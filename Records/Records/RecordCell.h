//
//  RecordCell.h
//  Records
//
//  Created by smn on 10/26/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Record;

@interface RecordCell : UITableViewCell

@property (nonatomic, strong) Record *record;

- (id)initWithRecord:(Record*)r;

@end
