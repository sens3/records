//
//  BaseTestCase.m
//  Records
//
//  Created by smn on 10/24/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import "BaseTestCase.h"

@implementation BaseTestCase

- (void)setUp
{
    _storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    _navController = [[UINavigationController alloc] init];
}

- (id)instantiateStoryboardControllerWithIdentifier:(NSString *)identifier
{
    id controller = [_storyboard instantiateViewControllerWithIdentifier:identifier];
    [_navController pushViewController:controller animated:NO];
    [controller loadView];
    return controller;
}

@end
