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
    return [[NSFileManager defaultManager] fileExistsAtPath:self.imagePath];
}

#pragma mark -
#pragma mark Public Methods

- (void)loadImageWithCompletionHandler:(void (^)(UIImage *, NSError *))handler {
    NSError *error = nil;
    NSData *imageData = [NSData dataWithContentsOfFile:self.imagePath];
    UIImage *image = [UIImage imageWithData:imageData];
    if (!image) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager removeItemAtPath:self.imagePath error:nil];
    }
    if (handler) {
        handler(image, error);
    }

}



@end
