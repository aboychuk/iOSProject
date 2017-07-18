//
//  UIWindow+ABExtension.h
//  iOSProject
//
//  Created by Andrew Boychuk on 17.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (ABExtension)

+ (instancetype)window;
+ (instancetype)windowWithRootViewController:(UIViewController *)controller;

@end
