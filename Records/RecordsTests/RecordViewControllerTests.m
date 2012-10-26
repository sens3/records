//
//  RecordViewControllerTests.m
//  Records
//
//  Created by smn on 10/25/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import "RecordViewControllerTests.h"
#import "RecordViewController.h"

//
// UIWebViewStub
//
@interface UIWebViewStub : UIWebView
@property (nonatomic, strong) NSURLRequest *loadedRequest;
@end

@implementation UIWebViewStub
- (void)loadRequest:(NSURLRequest *)request
{
    self.loadedRequest = request;
}
@end
//
//
//

@implementation RecordViewControllerTests{
    RecordViewController *controller;
}

- (void)setUp
{
    [super setUp];
    controller = [self instantiateStoryboardControllerWithIdentifier:@"Record"];
    controller.artistName = @"Duke Ellington";
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