//
//  ABView.m
//  iOSProject
//
//  Created by Andrew Boychuk on 8/17/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABView.h"

#import "UINib+ABExtension.h"

#import "ABConstants.h"

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
    [self prepareLoadingViewFromNib];
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithModel:(id)model {
    
}

#pragma mark -
#pragma mark Private Methods

- (void)prepareLoadingViewFromNib {
    ABLoadingView *loadingView = self.loadingView;
    
    loadingView = [UINib objectWithClass:[ABLoadingView class]];
    loadingView.frame = self.bounds;
    loadingView.visible = NO;

    self.loadingView = loadingView;
    
    [self addSubview:self.loadingView];
}

- (void)prepareLoadingView {
    self.loadingView = [ABLoadingView loadingViewWithSuperview:self];
}

@end
