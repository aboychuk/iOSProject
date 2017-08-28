//
//  ABView.m
//  iOSProject
//
//  Created by Andrew Boychuk on 8/17/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABView.h"

#import "UINib+ABExtension.h"

@interface ABView ()

- (void)prepareLoadingView;

@end

@implementation ABView

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self prepareLoadingView];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.loadingView = [UINib objectWithClass:[ABLoadingView class]];
    self.loadingView.frame = self.bounds;
    self.loadingView.alpha = 0.1;
    [self addSubview:self.loadingView];
//    [self prepareLoadingView];
}

#pragma mark -
#pragma mark Public

- (void)loadingViewVisible:(BOOL)visible {
    [self.loadingView setVisible:visible];
}

#pragma mark -
#pragma mark Private

- (void)prepareLoadingView {
    self.loadingView = [ABLoadingView loadingViewWithSuperview:self];
    
}

@end
