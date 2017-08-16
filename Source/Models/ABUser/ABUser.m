//
//  ABUser.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/7/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABUser.h"

#import "NSString+ABExtensions.h"

static NSString * const ABImageName = @"image";
static NSString * const ABImageType = @"png";

@implementation ABUser

@dynamic fullname;

@dynamic image;

#pragma mark
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = [NSString randomName];
        self.surname = [NSString randomName];
    }
    
    return self;
}

#pragma mark
#pragma mark Accessors

- (NSString *)fullname {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

- (UIImage *)image {
    NSString *path = [[NSBundle mainBundle] pathForResource:ABImageName ofType:ABImageType];
    
    return [UIImage imageWithContentsOfFile:path];
}

@end
