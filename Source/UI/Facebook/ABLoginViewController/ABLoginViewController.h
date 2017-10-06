//
//  ABLoginViewController.h
//  iOSProject
//
//  Created by Andrew Boychuk on 9/22/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ABUser;
@class ABContext;

@interface ABLoginViewController : UIViewController
@property (nonatomic, strong)   ABUser      *user;
@property (nonatomic, strong)   ABContext   *context;

- (IBAction)onLogin:(UIButton *)sender;

@end
