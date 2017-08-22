//
//  ABImageModel.m
//  iOSProject
//
//  Created by Andrew Boychuk on 20.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABImageModel.h"

#import "ABMacro.h"

#import "ABGCDExtension.h"

static const NSUInteger ABDelayBeforeDispatch = 10;

@interface ABImageModel ()
@property (nonatomic, strong)   UIImage     *image;
@property (nonatomic, strong)   NSURL       *url;

@end

@implementation ABImageModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageWithUrl:(NSURL *)url {
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

@end
