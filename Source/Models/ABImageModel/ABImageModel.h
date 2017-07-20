//
//  ABImageModel.h
//  iOSProject
//
//  Created by Andrew Boychuk on 20.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ABObservableObject.h"

typedef NS_ENUM(NSUInteger, ABImageModelState) {
    ABImageModelUnloaded,
    ABImageModelLoading,
    ABImageModelLoaded,
    ABImageModelLoadingFailed
};

@interface ABImageModel : ABObservableObject
@property (nonatomic, readonly)                     UIImage *image;
@property (nonatomic, readonly)                     NSURL   *url;
@property (nonatomic, readonly, getter=isLoaded)    BOOL    loaded;

+ (instancetype)imageWithUrl:(NSURL *)url;

- (instancetype)initWithUrl:(NSURL *)url;

- (void)load;
- (void)dump;

@end
