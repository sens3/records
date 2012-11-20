//
//  KIFTestScenario+Records.m
//  Records
//
//  Created by smn on 11/20/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import "KIFTestScenario+Records.h"
#import <KIFTestStep.h>

@implementation KIFTestScenario (Records)


+(id)viewRecordsList
{
    KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Viewing the Record List"];
    
    [scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Duke Ellington"]];
    [scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Sonny Rollins"]];
    
    return scenario;
}

+(id)viewDetails
{
    KIFTestScenario *scenario = [KIFTestScenario scenarioWithDescription:@"Viewing the Record Details"];
    
    [scenario addStep:[KIFTestStep stepToTapRowInTableViewWithAccessibilityLabel:@"Records TableView"
                                                                     atIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]]];
    
    [scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Artist Name: Duke Ellington"]];
    
    [scenario addStep:[KIFTestStep stepToTapViewWithAccessibilityLabel:@"Records"]];
    
    [scenario addStep:[KIFTestStep stepToWaitForViewWithAccessibilityLabel:@"Records TableView"]];
    
    return scenario;
}

@end
