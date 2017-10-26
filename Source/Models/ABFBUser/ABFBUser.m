//
//  ABFBUser.m
//  iOSProject
//
//  Created by Andrew Boychuk on 10/26/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFBUser.h"

#import "ABImageModel.h"
#import "ABUsersModel.h"

@implementation ABFBUser

@dynamic imageModel;

#pragma mark
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.friends = nil;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.friends = [ABUsersModel new];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (ABImageModel *)imageModel {
    return [ABImageModel imageWithUrl:self.imageUrl];
}

@end
