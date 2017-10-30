//
//  ABLoginViewController.m
//  iOSProject
//
//  Created by Andrew Boychuk on 9/22/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABLoginViewController.h"

#import "ABLoginView.h"
#import "ABUserDetailViewController.h"
#import "ABFBLoginContext.h"

ABViewControllerRootViewProperty(ABLoginViewController, rootView, ABLoginView)

@interface ABLoginViewController ()

- (void)showUserDetailViewController;

@end

@implementation ABLoginViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.model = nil;
    self.context = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.currentUser = [ABFBCurrentUser new];
    }
    
    return self;
}

#pragma mark -
#pragma mark Overriden Methods

- (void)updateViewWithModel:(ABModel *)model {
    [self showUserDetailViewController];
}

#pragma mark -
#pragma mark Actions

- (IBAction)onLogin:(UIButton *)sender {
    self.context = [ABFBLoginContext contextWithModel:self.model];
}

#pragma mark -
#pragma mark Private

- (void)showUserDetailViewController {
    ABUserDetailViewController *userDetailController = [ABUserDetailViewController new];
    userDetailController.model = self.currentUser;
    userDetailController.currentUser = self.currentUser;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:userDetailController];
    [self presentViewController:navigationController animated:YES completion:nil];
}

#pragma mark -
#pragma mark ABModelObserver

- (void)modelWillLoad:(id)model {
    ABWeakify(self);
    ABDispatchAsyncOnMainThread(^{
        ABStrongifyAndReturnIfNil(self);
        [self updateViewWithModel:model];
    });
}

@end
