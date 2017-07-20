//
//  ABUser.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/7/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABUser.h"

@implementation ABUser
@dynamic fullname;
@dynamic image;

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

- (UIImage *)image {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"image" ofType:@"png"];
    
    return [UIImage imageWithContentsOfFile:path];
}

@end
