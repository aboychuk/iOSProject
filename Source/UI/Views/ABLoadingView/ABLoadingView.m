//
//  ABLoadingView.m
//  iOSProject
//
//  Created by Andrew Boychuk on 8/11/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABLoadingView.h"

@implementation ABLoadingView

#pragma mark -
#pragma mark Initializations and Deallocations

+ (instancetype)initLoadingViewWithView:(UIView *)view {
    return [[self alloc] initWithFrame:view.bounds];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
    return self;
}

@end
