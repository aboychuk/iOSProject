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

@end

@implementation ABInternetImageModel

#pragma mark -
#pragma mark Accessors

- (void)setDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    if (_downloadTask != downloadTask) {
        [_downloadTask cancel];
        
        _downloadTask = downloadTask;
        [_downloadTask resume];
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)loadImageWithCompletionHandler:(void (^)(UIImage *, NSError *))handler {
    if (self.cached) {
        [super loadImageWithCompletionHandler:handler];
        if (self.image) {
            return;
        }
    }
    NSURLSession *urlSession = [NSURLSession sharedSession];
    NSFileManager *filemanager = [NSFileManager defaultManager];
    self.downloadTask = [urlSession downloadTaskWithURL:self.url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        [filemanager moveItemAtPath:location.path toPath:self.imagePath error:&error];
        if (error) {
            NSLog(@"Error occured while moving: %@", error);
        } else {
            [super loadImageWithCompletionHandler:handler];
        }
    }];
}

@end
