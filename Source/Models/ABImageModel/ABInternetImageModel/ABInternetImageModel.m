//
//  ABInternetImageModel.m
//  iOSProject
//
//  Created by Andrew Boychuk on 9/1/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABInternetImageModel.h"

@implementation ABInternetImageModel

#pragma mark -
#pragma mark Public Methods

- (UIImage *)loadImage {
    if (!self.cached) {
        UIImage image = [self loadImageWithCompletionHandler:^(UIImage *image, id error) {
            <#code#>
        }];
    } else {
        [super loadImage];
    }
    
    return nil;
}

- (UIImage *)loadImageWithCompletionHandler:(void(^)(UIImage *image, id error))handler {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:self.url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        [fileManager copyItemAtPath:location.path toPath:[self imagePath] error:nil];
        

    }];

    [task resume];
    UIImage *image = nil;
    if (handler) {
        image = [UIImage imageWithContentsOfFile:[self imagePath]];
    }
    
    return image;
}

@end
