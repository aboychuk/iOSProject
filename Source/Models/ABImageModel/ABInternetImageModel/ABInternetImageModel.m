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

- (void)loadImageWithCompletionHandler:(void(^)(UIImage *image, id error))handler {
    if (!self.cached) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSURLSession *session = [NSURLSession sharedSession];
        
        NSURLSessionDownloadTask *task = [session downloadTaskWithURL:self.url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
            [fileManager copyItemAtPath:location.path toPath:[self imagePath] error:nil];
            UIImage *image = [UIImage imageWithContentsOfFile:[self imagePath]];
            
            handler(image, error);
        }];
        
        [task resume];
    } else {
        [super loadImageWithCompletionHandler:handler];
    }
}

@end
