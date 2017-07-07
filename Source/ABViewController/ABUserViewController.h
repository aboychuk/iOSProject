//
//  ABUserViewController.h
//  iOSProject
//
//  Created by Andrew Boychuk on 7/7/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ABUser;

@interface ABUserViewController : UIViewController
@property (nonatomic, strong)   ABUser    *user;

- (IBAction)onRotateButton:(id)sender;

@end
