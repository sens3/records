//
//  RecordCellSpec.m
//  Records
//
//  Created by smn on 10/26/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import "SpectaTestCase.h"
#import "RecordCell.h"
#import "Record.h"

SpecBegin(RecordCell)

describe(@"RecordCell", ^{
    
    describe(@"init with record", ^{
        
        __block id record;
        __block RecordCell *cell;
        
        before(^{
            record = mock([Record class]);
            [given([record artistName]) willReturn:@"Miles Davis"];
            cell = [[RecordCell alloc] initWithRecord:record];
        });
        
        it(@"assigns the record", ^{
            expect(cell.record).to.equal(record);
        });
        
        it(@"sets the title from the record artist name", ^{
            expect(cell.textLabel.text).to.equal(@"Miles Davis");
        });
        
    });
    
});

SpecEnd

