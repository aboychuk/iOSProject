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

#pragma mark -
#pragma mark Accessors

- (ABSquereView *)squereView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[ABSquereView class]]) {
        return (ABSquereView *)self.view;
    }
    
    return nil;
}


#pragma mark -
#pragma mark Button Handlers

- (IBAction)onAuto:(UIButton *)sender {
    [self.squereView startCycleMove];
}

- (IBAction)onRandom:(UIButton *)sender {
    [self.squereView startRandomMoving];
}

@end
