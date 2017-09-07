//
//  ABImageModel.m
//  iOSProject
//
//  Created by Andrew Boychuk on 20.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABImageModel.h"
#import "ABImageModelCache.h"
#import "ABFileSystemImageModel.h"
#import "ABInternetImageModel.h"

#import "ABMacro.h"

#import "ABGCDExtension.h"

static const NSUInteger ABDelayBeforeDispatch   = 1;
static NSString *const  ABImagePath             = @"imagePath";

@interface ABImageModel ()
@property (nonatomic, strong)   UIImage     *image;
@property (nonatomic, strong)   NSURL       *url;

@end

@implementation ABImageModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageWithUrl:(NSURL *)url {
    ABImageModel *imageModel = nil;
    ABImageModelCache *cache = [ABImageModelCache sharedCache];
    imageModel = [cache modelForKey:url];
    if (!imageModel) {
        Class imageModelClass = url.isFileURL ? [ABFileSystemImageModel class] : [ABInternetImageModel class];
        imageModel = [[imageModelClass alloc] initWithUrl:url];
        
        [cache addModel:imageModel forKey:url];
    }
    
    return imageModel;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    ABImageModelCache *cache = [ABImageModelCache sharedCache];
    [cache removeModelForKey:self.url];
}

- (instancetype)initWithUrl:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)performLoading {
    self.image = [self loadImage];
    ABDispatchAsyncOnMainThread(^{
        self.state = self.image ? ABModelDidLoad : ABModelDidFailLoading;
    });
}

- (void)dumpModel {
    self.image = nil;
    self.state = ABModelDidUnloaded;
}

- (UIImage *)loadImage {
    return nil;
}

- (NSString *)imagePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *imagePath = [[paths firstObject] stringByAppendingPathComponent:ABImagePath] ;
    
    return [imagePath stringByAppendingString:[self.url.path stringByDeletingLastPathComponent]];
}

@end
