//
//  UIWebViewStub.m
//  Records
//
//  Created by smn on 10/26/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import "UIWebViewStub.h"

@implementation UIWebViewStub
- (void)loadRequest:(NSURLRequest *)request
{
    self.loadedRequest = request;
}
@end
