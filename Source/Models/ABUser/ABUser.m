//
//  ABUser.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/7/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABUser.h"

#import "NSString+ABExtensions.h"

static NSString * const ABName = @"name";
static NSString * const ABSurname = @"surname";

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
    NSString *path = [[NSBundle mainBundle] pathForResource:@"image" ofType:@"png"];
    
    return [UIImage imageWithContentsOfFile:path];
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