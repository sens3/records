//
//  RecordsTestController.m
//  Records
//
//  Created by smn on 11/20/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import "RecordsTestController.h"
#import "KIFTestScenario+Records.h"

@implementation RecordsTestController

- (void)initializeScenarios
{
    [KIFTestStep setDefaultTimeout:5.0];
    
    [self addScenario:[KIFTestScenario viewRecordsList]];
    [self addScenario:[KIFTestScenario viewDetails]];
}

@end
