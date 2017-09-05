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
    UIImage *image = nil;
    if (!self.cached) {
        NSData *imageData = [NSData dataWithContentsOfURL:self.url];
        [self saveData:imageData];
        image = [UIImage imageWithData:imageData];
    } else {
        [super loadImage];
    }
   
    return image;
}

- (void)loadImageWithCompletionHandler:(ABCompletionHandlerBlock)handler {
    __block NSData *data = nil;
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:self.url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        data = [NSData dataWithContentsOfURL:location];
    }];
    
    [task resume];
    
}


- (void)saveData:(NSData *)data {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL directoryCreated = [fileManager createDirectoryAtPath:[self imagePath] withIntermediateDirectories:NO attributes:nil error:nil];
    if (!directoryCreated) {
        NSLog(@"Unable to create directory to filesystem");

    }
    BOOL saved = [fileManager createFileAtPath:[self imagePath] contents:data attributes:nil];
    if (!saved) {
        NSLog(@"Unable to save image to filesystem");
    }
}

@end
