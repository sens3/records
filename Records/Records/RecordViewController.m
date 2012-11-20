//
//  RecordViewController.m
//  Records
//
//  Created by smn on 10/25/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import "RecordViewController.h"
#import "Record.h"

@interface RecordViewController ()

@end

@implementation RecordViewController
@synthesize webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setTitle:_record.artistName];
    [self.navigationItem setAccessibilityLabel:[NSString stringWithFormat:@"Artist Name: %@", _record.artistName]];

    [self initRequest];
    [self.webView loadRequest:_request];
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)initRequest
{
    if (!_request) {
        NSString *urlString = [@"http://www.discogs.com/search?q=" stringByAppendingString:_record.artistName];
        urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        _request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    }
    
}

@end
