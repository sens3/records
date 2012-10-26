//
//  RecordViewControllerTests.m
//  Records
//
//  Created by smn on 10/25/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import "RecordViewControllerTests.h"
#import "RecordViewController.h"
#import "Record.h"


@implementation RecordViewControllerTests{
    RecordViewController *controller;
    UINavigationController *navController;
    Record *duke;
}

- (void)setUp
{
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    controller = [storyboard instantiateViewControllerWithIdentifier:@"Record"];
    duke = [[Record alloc] init];
    duke.artistName = @"Duke Ellington";
    controller.record = duke;
    navController = [[UINavigationController alloc] init];
    [navController pushViewController:controller animated:NO];
    [controller loadView];
}

- (void)test_RecordVC_existsInTheStoryboard
{
    STAssertNotNil(controller, nil);
}

- (void)test_RecordVC_hasAWebView
{
    STAssertNotNil(controller.webView, nil);
}

- (void)test_RecordVC_viewDidLoad_setsTheTitle
{
    [controller viewDidLoad];
    
    NSString *actual = controller.navigationItem.title;
    
    STAssertEqualObjects(@"Duke Ellington", actual, nil);
}

- (void)test_RecordVC_viewDidLoad_initsTheRequest
{
    [controller viewDidLoad];
    
    NSString *actual = controller.request.URL.absoluteString;
    NSString *expected = @"http://www.discogs.com/search?q=Duke%20Ellington";
    
    STAssertEqualObjects(expected, actual, nil);
}

- (void)test_RecordVC_viewDidLoad_loadsRequestInWebView
{
    id requestMock = mock([NSURLRequest class]);
    UIWebViewStub *webViewStub = [[UIWebViewStub alloc] init];
    controller.webView = webViewStub;
    controller.request = requestMock;
    [controller viewDidLoad];
    
    STAssertEquals(requestMock, webViewStub.loadedRequest, nil);
}

@end
