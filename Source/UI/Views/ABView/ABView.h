//
//  ABView.h
//  iOSProject
//
//  Created by Andrew Boychuk on 8/17/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ABLoadingView.h"

@interface ABView : UIView
@property (nonatomic, strong)   ABLoadingView   *loadingView;

- (void)loadingViewVisible:(BOOL)visible;

@end
