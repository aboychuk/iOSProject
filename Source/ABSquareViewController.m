//
//  ABSquareViewController.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/8/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABSquareViewController.h"

#import "ABSquareView.h"

#import "ABMacro.h"

ABViewControllerRootViewProperty(ABSquareViewController, ABSquareView, squereView)

@implementation ABSquareViewController

#pragma mark -
#pragma mark Button Handlers

- (IBAction)onAuto:(UIButton *)sender {
    [self.squereView startCycleMove];
}

- (IBAction)onRandom:(UIButton *)sender {
    [self.squereView startRandomMoving];
}

@end
