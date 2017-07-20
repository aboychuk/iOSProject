//
//  ABImageModel.m
//  iOSProject
//
//  Created by Andrew Boychuk on 20.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABImageModel.h"

#import "ABImageModelDispatcher.h"

@interface ABImageModel ()
@property (nonatomic, strong)   UIImage     *image;
@property (nonatomic, strong)   NSURL       *url;
@property (nonatomic, strong)   NSOperation *operation;

- (NSOperation *)imageLoadingOperation;

@end

@implementation ABImageModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageWithUrl:(NSURL *)url {
    return [[self alloc] initWithUrl:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.operation = nil;
}

- (instancetype)initWithUrl:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setOperation:(NSOperation *)operation {
    if (_operation != operation) {
        [_operation cancel];
        
        _operation = operation;
        
        if (operation) {
            ABImageModelDispatcher *dispatcher = [ABImageModelDispatcher sharedDispatcher];
            [dispatcher.queue addOperation:operation];

        }
    }
}

#pragma mark -
#pragma mark Public Methods

- (void)load {
    @synchronized (self) {
        if (ABImageModelLoading == self.state) {
            return;
        }
        
        if (ABImageModelUnloaded == self.state) {
            [self notifyOfState:ABImageModelUnloaded];
            return;
        }
        self.state = ABImageModelLoading;
    }
    self.operation = [self imageLoadingOperation];
}

- (void)dump {
    self.operation = nil;
    self.image = nil;
    self.state = ABImageModelUnloaded;
}

#pragma mark -
#pragma mark Private Methods

- (NSOperation *)imageLoadingOperation {
    __weak ABImageModel *weakSelf = self;
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        __strong ABImageModel *strongSelf = weakSelf;
        strongSelf.image = [UIImage imageWithContentsOfFile:[self.url absoluteString]];
    }];
    
    operation.completionBlock = ^{
        __strong ABImageModel *strongSelf = weakSelf;
        strongSelf.state = self.image ? ABImageModelLoaded : ABImageModelLoadingFailed;
    };
    
    return operation;
}

@end
