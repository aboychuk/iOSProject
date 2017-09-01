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
    NSData *imageData = [NSData dataWithContentsOfURL:self.url];
    UIImage *image = [UIImage imageWithData:imageData];
    return image;
}


@end
