//
//  ABImageModel.m
//  iOSProject
//
//  Created by Andrew Boychuk on 20.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABImageModel.h"
#import "ABSharedCache.h"
#import "ABFileSystemImageModel.h"
#import "ABInternetImageModel.h"

#import "ABMacro.h"

#import "ABGCDExtension.h"

static const NSUInteger ABDelayBeforeDispatch   = 10;
static NSString *const  ABImageURL              = @"imageURL";

@interface ABImageModel ()
@property (nonatomic, strong)   UIImage     *image;
@property (nonatomic, strong)   NSURL       *url;

@end

@implementation ABImageModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageWithUrl:(NSURL *)url {
    ABSharedCache *cache = [ABSharedCache sharedCache];
    ABImageModel *imageModel = [cache objectForKey:url];

    if (imageModel) {
       return [[ABFileSystemImageModel alloc] initWithUrl:url];
    } else {
        return [[ABInternetImageModel alloc] initWithUrl:url];
    }
    
    return [[self alloc] initWithUrl:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

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
    ABDispatchAfterDelay(ABDelayBeforeDispatch, ^{
        self.image = [UIImage imageWithContentsOfFile:self.url.path];
        self.state = self.image ? ABModelDidLoad : ABModelDidFailLoading;
    });
}

- (void)dumpModel {
    self.image = nil;
    self.state = ABModelDidUnloaded;
}

#pragma mark -
#pragma marl NSCoding

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.url = [coder decodeObjectForKey:ABImageURL];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.url forKey:ABImageURL];
}


@end
