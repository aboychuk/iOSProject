//
//  ABUser.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/7/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABUser.h"

@implementation ABUser

#pragma mark
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = @"Name";
        self.surname = @"Surname";
    }
    
    return self;
}

#pragma mark
#pragma mark Accessors

- (NSString *)fullname {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

@end
