//
//  RecordViewController.h
//  Records
//
//  Created by smn on 10/25/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordViewController : UIViewController

@property (nonatomic, assign) NSString *artistName;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSURLRequest *request;

- (void) initRequest;

@end
