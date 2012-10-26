//
//  RecordViewController.h
//  Records
//
//  Created by smn on 10/25/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Record;

@interface RecordViewController : UIViewController

@property (nonatomic, strong) Record *record;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSURLRequest *request;

- (void) initRequest;

@end
