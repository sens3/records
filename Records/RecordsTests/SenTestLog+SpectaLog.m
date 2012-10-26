//
//  SenTestLog+SpectaLog.m
//  Records
//
//  Created by smn on 10/26/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import "SenTestLog+SpectaLog.h"

@implementation SenTestLog (SpectaLog)

static void testlog (NSString *message)
{
	NSString *line = [NSString stringWithFormat:@"%@\n", message];
	[(NSFileHandle *)[NSFileHandle fileHandleWithStandardError] writeData:[line dataUsingEncoding:NSUTF8StringEncoding]];
}

+ (void) testCaseDidStart:(NSNotification *) aNotification
{
//    SenTestRun *run = [aNotification run];
//    testlog ([NSString stringWithFormat:@"Test Case '%@' started.", [run test]]);
}

+ (void) testCaseDidStop:(NSNotification *) aNotification
{
    SenTestRun *run = [aNotification run];
    if (![run hasSucceeded]) {
        testlog ([NSString stringWithFormat:@"Test Case '%@' started.", [run test]]);       
        testlog ([NSString stringWithFormat:@"Test Case '%@' %s (%.3f seconds).", [run test], ([run hasSucceeded] ? "passed" : "failed"), [run totalDuration]]);
    }
}


+ (void) testSuiteDidStart:(NSNotification *) aNotification
{
}


+ (void) testSuiteDidStop:(NSNotification *) aNotification
{
    SenTestRun *run = [aNotification run];
    
    if (![run hasSucceeded]) {
        testlog ([NSString stringWithFormat:@"Test Suite '%@' finished at %@.\nPassed %d test%s, with %d failure%s (%d unexpected) in %.3f (%.3f) seconds\n",
                  [run test],
                  [run stopDate],
                  [run testCaseCount], ([run testCaseCount] != 1 ? "s" : ""),
                  [run totalFailureCount], ([run totalFailureCount] != 1 ? "s" : ""),
                  [run unexpectedExceptionCount],
                  [run testDuration],
                  [run totalDuration]]);
    } else {
        testlog ([NSString stringWithFormat:@"Test Suite '%@' finished", [run test]]);
    }
}


+ (void) testCaseDidFail:(NSNotification *) aNotification
{
    NSException *exception = [aNotification exception];
    testlog ([NSString stringWithFormat:@"%@:%@: error: %@ : %@",
              [exception filePathInProject],
              [exception lineNumber],
              [aNotification test],
              [exception reason]]);
}


@end
