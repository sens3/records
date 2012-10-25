//
//  BaseTestCase.h
//  Records
//
//  Created by smn on 10/24/12.
//  Copyright (c) 2012 smn. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>

@interface BaseTestCase : SenTestCase

@property (nonatomic, readonly, strong) UIStoryboard *storyboard;
@property (nonatomic, readonly, strong) UINavigationController *navController;

- (id)instantiateStoryboardControllerWithIdentifier:(NSString *)identifier;

@end
