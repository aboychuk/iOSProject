//
//  ABInternetImageModel.m
//  iOSProject
//
//  Created by Andrew Boychuk on 9/1/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABInternetImageModel.h"

@interface ABInternetImageModel ()
@property (nonatomic, strong)   NSURLSessionDownloadTask    *downloadTask;
@property (nonatomic, strong)   NSURLSession                *session;

@end

@implementation ABInternetImageModel

#pragma mark -
#pragma mark Accessors

- (NSURLSession *)session {
    return [NSURLSession sharedSession];
}

- (void)setDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    if (_downloadTask != downloadTask) {
        [_downloadTask cancel];
        
        _downloadTask = downloadTask;
        [downloadTask resume];
    }
}

#pragma mark -
#pragma mark Public Methods

//- (UIImage *)loadImage {
//    if (!self.cached) {
//        UIImage *image = [self loadImageWithCompletionHandler:^(UIImage *image, id error) {
//            self.image = image;
//        }];
//    } else {
//        [super loadImage];
//    }
//    
//    return nil;
//}

- (UIImage *)loadImageWithCompletionHandler:(void(^)(UIImage *image, id error))handler {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURLSession *session = self.session;
    
    self.downloadTask = [session downloadTaskWithURL:self.url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        [fileManager copyItemAtPath:location.path toPath:[self imagePath] error:nil];
    }];

    UIImage *image = nil;
    if (handler) {
        image = [UIImage imageWithContentsOfFile:[self imagePath]];
    }
    
    return image;
}

@end
