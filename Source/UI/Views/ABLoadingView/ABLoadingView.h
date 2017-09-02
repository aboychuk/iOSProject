//
//  ABLoadingView.h
//  iOSProject
//
//  Created by Andrew Boychuk on 8/11/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABLoadingView : UIView
@property (nonatomic, strong)                       IBOutlet UIActivityIndicatorView    *spinner;
@property (nonatomic, assign, getter=isVisible)     BOOL                                visible;

+ (instancetype)loadingViewWithSuperview:(UIView *)view;

- (void)setVisible:(BOOL)visible
          animated:(BOOL)animated;

- (void)setVisible:(BOOL)visible
          animated:(BOOL)animated
 completionHandler:(void (^)(BOOL))completionHandler;

@end
