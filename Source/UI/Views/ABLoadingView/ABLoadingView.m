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

+ (instancetype)initLoadingViewWithSuperview:(UIView *)superview {
    ABLoadingView *loadingView = [[self alloc] initWithFrame:superview.bounds];
    [superview addSubview:loadingView];
    
    return loadingView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    
    return self;
}

@end
