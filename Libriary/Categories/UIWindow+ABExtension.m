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
    return [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
