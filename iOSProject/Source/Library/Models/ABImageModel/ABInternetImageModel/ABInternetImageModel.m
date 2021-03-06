//
//  ABInternetImageModel.m
//  iOSProject
//
//  Created by Andrew Boychuk on 9/1/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABInternetImageModel.h"

#import "NSFileManager+ABExtension.h"

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
    NSString *imagePath = self.imagePath;
    
    if (self.cached) {
        [super loadImageWithCompletionHandler:handler];
        if (self.image) {
            return;
        }
    }
    self.downloadTask = [urlSession downloadTaskWithURL:self.url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        BOOL created = [filemanager createFolderAtPath:imagePath];
        if (created && !error) {
            [filemanager moveItemAtPath:location.path toPath:imagePath error:&error];
            [super loadImageWithCompletionHandler:handler];
        } else {
            NSLog(@"%c, %@", created, error);
        }
    }];
}

@end
