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
    NSURLSession *urlSession = [NSURLSession sharedSession];
    NSFileManager *filemanager = [NSFileManager defaultManager];
    if (self.cached) {
        [super loadImageWithCompletionHandler:handler];
        if (self.image) {
            return;
        }
    }
    self.downloadTask = [urlSession downloadTaskWithURL:self.url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        BOOL created = [self createDirectoryAtPath:self.imagePath];
        if (created) {
            [filemanager moveItemAtPath:location.path toPath:self.imagePath error:&error];
            if (!error) {
                [super loadImageWithCompletionHandler:handler];
            }
        }
    }];
}

- (BOOL)createDirectoryAtPath:(NSString *)path {
    NSError *error = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        return YES;
    } else {
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
        if (!error) {
            return YES;
        }
    }
    
    return NO;
}


@end
