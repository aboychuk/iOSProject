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

- (UIImage *)loadImage {
    UIImage *image = nil;
    if (self.cached) {
        image = [super loadImage];
    } else {
        NSData *imageData = [NSData dataWithContentsOfURL:self.url];
        [self saveData:imageData];
        image = [UIImage imageWithData:imageData];
    }
   
    return image;
}

- (void)loadImageWithCompletionHandler:(void(^)(UIImage *, NSError *))handler {
    if (self.cached) {
        [super loadImageWithCompletionHandler:handler];
        if (self.image) {
            return;
        }
    }
    NSURLSession *urlSession = [NSURLSession sharedSession];
    NSFileManager *filemanager = [NSFileManager defaultManager];
    self.downloadTask = [urlSession downloadTaskWithURL:self.url
                                      completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error)
    {
        [filemanager copyItemAtPath:location.path toPath:[self imagePath] error:nil];
        
        [super loadImageWithCompletionHandler:handler];
    }];

}

- (void)saveData:(NSData *)data {
    BOOL saved = [data writeToFile:[self imagePath] atomically:YES];
    if (!saved) {
        NSLog(@"Not Saved");
    }
}

@end
