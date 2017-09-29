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
#import "ABModel.h"
#import "ABContext.h"
#import "ABLoginContext.h"
#import "ABUser.h"

#import "ABMacro.h"

@interface ABLoginViewController ()
@property (nonatomic, strong)   ABModel     *model;
@property (nonatomic, strong)   ABContext   *context;

@end

ABViewControllerRootViewProperty(ABLoginViewController, rootView, ABLoginView)

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
        self.model = [ABUser new];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(ABModel *)model {
    if (_model != model) {
        [_model removeObserver:self];
        
        _model = model;
        [_model addObserver:self];
    }
}

- (void)setContext:(ABContext *)context {
    if (_context != context) {
        [_context cancel];
        
        _context = context;
        [_context execute];
    }
}

#pragma mark -
#pragma mark Actions

- (IBAction)onLogin:(UIButton *)sender {
    self.context = [ABLoginContext contextWithModel:self.model];
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([FBSDKAccessToken currentAccessToken]) {
        [self showUserDetailViewController];
    }
}

#pragma mark -
#pragma mark Private

- (void)showUserDetailViewController {
    [self.navigationController pushViewController:[ABUserDetailViewController new] animated:YES];
}

@end
