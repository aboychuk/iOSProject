//
//  ABFBViewController.h
//  iOSProject
//
//  Created by Andrew Boychuk on 10/10/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ABUser.h"
#import "ABContext.h"

@interface ABFBViewController : UIViewController
@property (nonatomic, strong)   ABUser      *user;
@property (nonatomic, strong)   ABContext   *context;

@end
