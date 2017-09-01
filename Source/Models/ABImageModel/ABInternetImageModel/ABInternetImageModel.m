//
//  ABInternetImageModel.m
//  iOSProject
//
//  Created by Andrew Boychuk on 9/1/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABInternetImageModel.h"

@implementation ABInternetImageModel

- (UIImage *)loadImage {
    [self downloadImage];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfFile:[self imagePath]]];
    return image;
}

- (void)downloadImage {
    NSURLSession *urlSession = [NSURLSession sharedSession];
    NSURLSessionDownloadTask *downloadTask = [urlSession downloadTaskWithURL:self.url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        NSData *imageData = [NSData dataWithContentsOfURL:location];
        [imageData writeToFile:[self imagePath] atomically:YES];
        
    }];
    [downloadTask resume];
}


@end
