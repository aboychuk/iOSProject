//
//  ABUserViewController.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/7/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABUserViewController.h"

#import "ABUserView.h"

@interface ABUserViewController ()
@property (nonatomic, readonly) ABUserView  *userView;

@end

@implementation ABUserViewController

#pragma mark
#pragma mark Accessors

- (void)setUser:(ABUser *)user {
    if (_user != user) {
        _user = user;
    }
    
    self.userView.user = user;
}

- (ABUserView *)userView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[ABUserView class]]) {
        return (ABUserView *)self.view;
    }
    
    return nil;
}

#pragma mark
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userView.user = self.user;
    
//    [[(ABUserView *) [self view] label] setText:@"PAPA"];
    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    
//    label.text = @"AABAVB";
//    label.backgroundColor = [UIColor blackColor];
//    label.textColor = [UIColor whiteColor];
//    
//    self.view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
//    self.view.opaque = NO;
//    
//    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark
#pragma mark Interface Handling




@end
