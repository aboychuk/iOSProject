//
//  ABFileSystemImageModel.m
//  iOSProject
//
//  Created by Andrew Boychuk on 8/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABFileSystemImageModel.h"

@implementation ABFileSystemImageModel

#pragma mark -
#pragma mark Public Methods

- (UIImage *)loadImage {
    return [UIImage imageWithContentsOfFile:self.url.path];
}


@end
