//
//  ABUser.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/7/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABUser.h"

static NSString * const ABName = @"name";
static NSString * const ABSurname = @"surname";

@implementation ABUser

@dynamic fullname;

#pragma mark
#pragma mark Accessors

- (NSString *)fullname {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

#pragma mark -
#pragma marl NSCoding

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:ABName];
        self.surname = [coder decodeObjectForKey:ABSurname];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.name forKey:ABName];
    [coder encodeObject:self.surname forKey:ABSurname];
}

@end
