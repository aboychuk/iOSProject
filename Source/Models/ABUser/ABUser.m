//
//  ABUser.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/7/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABUser.h"

#import "ABImageModel.h"

#import "ABRandomNumber.h"
#import "NSString+ABExtensions.h"

static NSString * const ABName = @"name";
static NSString * const ABSurname = @"surname";
static NSString * const ABImageName = @"image";
static NSString * const ABImageType = @"png";


@implementation ABUser
@dynamic fullname;
@dynamic imageModel;

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

- (ABImageModel *)imageModel {
    return [ABImageModel imageWithUrl:self.imageURL];
}

- (NSURL *)imageURL {
    NSURL *url = [NSURL URLWithString:
     @"http://upload.wikimedia.org/wikipedia/commons/7/7f/Williams_River-27527.jpg"];
//    NSURL *url = [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:ABImageName ofType:ABImageType]];
    
    return url;
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
