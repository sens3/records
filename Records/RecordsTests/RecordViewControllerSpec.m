//
//  RecordViewControllerSpec.m
//  Records
//
//  Created by smn on 10/26/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import "SpectaTestCase.h"
#import "RecordViewController.h"
#import "Record.h"

SpecBegin(RecordViewController)

describe(@"RecordViewController", ^{
    
    __block RecordViewController *controller;
    __block UINavigationController *navController;
    __block Record *duke;
    
    before(^{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        controller = [storyboard instantiateViewControllerWithIdentifier:@"Record"];
        duke = [[Record alloc] init];
        duke.artistName = @"Duke Ellington";
        controller.record = duke;
        navController = [[UINavigationController alloc] init];
        [navController pushViewController:controller animated:NO];
        [controller loadView];
    });
    
    it(@"exists in the storyboard", ^{
        expect(controller).notTo.beNil();
    });
    
    it(@"has a web view", ^{
        expect(controller.webView).notTo.beNil();
    });
    
    describe(@"view did load", ^{
        
        before(^{
            [controller viewDidLoad];            
        });
        
        it(@"sets the title", ^{
            NSString *title = controller.navigationItem.title;
            expect(title).to.equal(@"Duke Ellington");
        });
        
        it(@"inits the request", ^{
            NSString *actual = controller.request.URL.absoluteString;
            NSString *expected = @"http://www.discogs.com/search?q=Duke%20Ellington";
            expect(actual).equal(expected);
        });
        
        it(@"loads request in webview", ^{
            id requestMock = mock([NSURLRequest class]);
            UIWebViewStub *webViewStub = [[UIWebViewStub alloc] init];
            controller.webView = webViewStub;
            controller.request = requestMock;
            [controller viewDidLoad];
            
            expect(webViewStub.loadedRequest).to.equal(requestMock);
        });
        
    });
    
});

SpecEnd
