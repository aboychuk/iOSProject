//
//  ABLoadingView.m
//  iOSProject
//
//  Created by Andrew Boychuk on 8/11/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABLoadingView.h"

static const NSTimeInterval ABDefaultTimerDuration  = 1;
static const CGFloat        ABVisibleAlpha          = 1;
static const CGFloat        ABInisibleAlpha         = 0.0;

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
//        [self initView];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
//    [self initView];
}

#pragma mark -
#pragma mark Public

- (void)setVisible:(BOOL)visible {
    [self setVisible:visible animated:YES];
}

- (void)setVisible:(BOOL)visible
          animated:(BOOL)animated
{
    [self setVisible:visible
            animated:animated
   completionHandler:nil];
}

- (void)setVisible:(BOOL)visible
          animated:(BOOL)animated
 completionHandler:(void (^)(void))completionHandler
{
    [UIView animateWithDuration:ABDefaultTimerDuration
                     animations:^{
                         self.alpha = visible ? ABVisibleAlpha : ABInisibleAlpha;
                     }
                     completion:^(BOOL finished) {
                         if (completionHandler) {
                             completionHandler();
                             
                         }
                     }];
}


#pragma mark -
#pragma mark Private

- (void)initView {
    self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin
                                | UIViewAutoresizingFlexibleWidth
                                | UIViewAutoresizingFlexibleRightMargin
                                | UIViewAutoresizingFlexibleTopMargin
                                | UIViewAutoresizingFlexibleHeight
                                | UIViewAutoresizingFlexibleBottomMargin;
        [self initSpinner];
}

- (void)initSpinner {
    UIActivityIndicatorView *spinner = self.spinner;
    if (!spinner) {
        spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        spinner.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        spinner.center = self.center;
        NSLog(@"%@", NSStringFromCGPoint(self.center));
        NSLog(@"%@", NSStringFromCGPoint(spinner.center));
        [self addSubview:spinner];
        
        [spinner startAnimating];
        
        self.spinner = spinner;;
    }
    
    
}

@end
