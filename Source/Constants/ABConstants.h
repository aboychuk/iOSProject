//
//  ABConstants.h
//  iOSProject
//
//  Created by Andrew Boychuk on 8/23/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark -
#pragma mark ABUsersModel constants

typedef void(^ABVoidBlock)(void);

static NSString * const ABPlistName     = @"users.plist";
static const NSUInteger ABUsersCount    = 10;
static const NSUInteger ABDispatchDelay = 1;

//UIView autoresizing constants
static const UIViewAutoresizing ABAutoresizeWithFixedPosition = UIViewAutoresizingFlexibleLeftMargin
                                                                | UIViewAutoresizingFlexibleWidth
                                                                | UIViewAutoresizingFlexibleRightMargin
                                                                | UIViewAutoresizingFlexibleTopMargin
                                                                | UIViewAutoresizingFlexibleHeight
                                                                | UIViewAutoresizingFlexibleBottomMargin;


static const UIViewAutoresizing ABAutoresize = UIViewAutoresizingFlexibleWidth
                                                | UIViewAutoresizingFlexibleHeight;
