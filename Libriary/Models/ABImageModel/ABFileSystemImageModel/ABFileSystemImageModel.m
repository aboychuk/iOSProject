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

- (UIImage *)loadImage {
    NSData *imageData = [NSData dataWithContentsOfFile:[self imagePath]];
    UIImage *image = [UIImage imageWithData:imageData];
    if (!image) {
        image = [UIImage imageWithContentsOfFile:self.url.path];
    }
    
    return image;
}

- (void)loadImageWithCompletionHandler:(void (^)(UIImage *, NSError *))handler {
    NSData *imageData = [NSData dataWithContentsOfFile:[self imagePath]];
    UIImage *image = [UIImage imageWithData:imageData];
    NSError *error = nil;
    if (handler) {
        handler(image, error);
    }
}



@end
