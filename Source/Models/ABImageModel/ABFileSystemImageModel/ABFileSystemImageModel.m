//
//  ABFileSystemImageModel.m
//  iOSProject
//
//  Created by Andrew Boychuk on 8/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFileSystemImageModel.h"

@implementation ABFileSystemImageModel

@dynamic cached;

#pragma mark -
#pragma mark Accessors

- (BOOL)cached {
    return [[NSFileManager defaultManager] fileExistsAtPath:[self imagePath]];
}

#pragma mark -
#pragma mark Public Methods

- (void)loadImageWithCompletionHandler:(void(^)(UIImage *image, id error))handler {
    UIImage *image;
    if (self.cached) {
        image = [UIImage imageNamed:self.url.path];
    } else {
        image = [UIImage imageWithContentsOfFile:[self imagePath]];

    }
    handler(image, nil);
}

@end
