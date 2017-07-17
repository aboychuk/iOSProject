//
//  ABSquereViewController.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/8/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABSquereViewController.h"

#import "ABSquereView.h"

@interface ABSquereViewController ()
@property (nonatomic, readonly) ABSquereView    *squereView;

@end

@implementation ABSquereViewController

@dynamic squereView;

#pragma mark - Accessors

- (ABSquereView *)squareView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[ABSquereView class]]) {
        return (ABSquereView *)self.view;
    }
    
    return nil;
}


@end
