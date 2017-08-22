//
//  ABAppDelegate.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/5/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABAppDelegate.h"

#import "ABUsersViewController.h"
#import "ABUser.h"
#import "ABUsersModel.h"
#import "ABArrayModel.h"

#import "NSObject+ABObjectExtension.h"

@interface ABAppDelegate ()

@end

@implementation ABAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = window;

    ABUsersViewController *controller = [ABUsersViewController new];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    window.rootViewController = navigationController;
    
    [window makeKeyAndVisible];
    
    controller.usersModel = [[ABUsersModel alloc] init];
    self.usersModel = controller.usersModel;

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {

}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self.usersModel saveModel];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    [self.usersModel loadModel];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {
    [self.usersModel dumpModel];
}


@end
