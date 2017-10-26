//
//  ABFBContext.m
//  iOSProject
//
//  Created by Andrew Boychuk on 10/9/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFBContext.h"

#import "ABUser.h"

@implementation ABFBContext

#pragma mark -
#pragma mark Accessors

- (ABFBUser *)user {
    return self.model;
}

@end
