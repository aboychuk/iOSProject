//
//  ABAppDelegate.h
//  iOSProject
//
//  Created by Andrew Boychuk on 7/5/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ABUsersModel.h"

@interface ABAppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic)   UIWindow        *window;
@property (strong, nonatomic)   ABUsersModel    *usersModel;

@end

