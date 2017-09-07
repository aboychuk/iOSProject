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
    UIImage *image = nil;
//    if (self.cached) {
//        [super loadImage];
//    } else {
        NSData *imageData = [NSData dataWithContentsOfURL:self.url];
        [self saveData:imageData];
        image = [UIImage imageWithData:imageData];
//    }
   
    return image;
}

- (void)saveData:(NSData *)data {
    BOOL saved = [data writeToFile:[self imagePath] atomically:YES];
    if (!saved) {
        NSLog(@"Not Saved");
    }
}

@end
