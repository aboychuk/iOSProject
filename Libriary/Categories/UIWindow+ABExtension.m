//
//  UIWindow+ABExtension.m
//  iOSProject
//
//  Created by Andrew Boychuk on 17.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "UIWindow+ABExtension.h"

@implementation UIWindow (ABExtension)

+ (instancetype)window {
    return [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

+ (instancetype)windowWithRootViewController:(UIViewController *)controller {
    UIWindow *window = [self window];
    window.rootViewController = controller;
    [window makeKeyAndVisible];
    
    return window;
}

@end
