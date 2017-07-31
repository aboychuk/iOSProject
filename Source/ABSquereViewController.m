//
//  ABSquereViewController.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/8/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABSquereViewController.h"

#import "ABSquereView.h"

#import "ABMacro.h"

ABViewControllerRootViewProperty(ABSquereViewController, ABSquereView, squereView)

@implementation ABSquereViewController

#pragma mark -
#pragma mark Button Handlers

- (IBAction)onAuto:(UIButton *)sender {
    [self.squereView startCycleMove];
}

- (IBAction)onRandom:(UIButton *)sender {
    [self.squereView startRandomMoving];
}

@end
