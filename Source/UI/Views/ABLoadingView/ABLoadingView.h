//
//  ABLoadingView.h
//  iOSProject
//
//  Created by Andrew Boychuk on 8/11/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABLoadingView : UIView
@property (nonatomic, strong)   IBOutlet UIActivityIndicatorView    *indicatorView;

+ (instancetype)initLoadingViewWithView:(UIView *)view;

@end
