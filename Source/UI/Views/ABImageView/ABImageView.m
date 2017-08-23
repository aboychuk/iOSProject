//
//  ABImageView.m
//  iOSProject
//
//  Created by Andrew Boychuk on 8/17/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABImageView.h"

#import "ABImageModel.h"

#import "UINib+ABExtension.h"
#import "ABGCDExtension.h"

@interface ABImageView ()

- (void)prepareContentView;
- (void)fillWithModel:(ABImageModel *)model;

@end

@implementation ABImageView

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self prepareContentView];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self prepareContentView];
}


#pragma mark -
#pragma mark Accessors

- (void)setImageModel:(ABImageModel *)imageModel {
    if (_imageModel != imageModel) {
        [_imageModel removeObserver:self];
        
        _imageModel = imageModel;
        [_imageModel addObserver:self];
        
        [_imageModel loadModel];
    }
}

- (void)setContentImageView:(UIImageView *)contentImageView {
    if (_contentImageView != contentImageView) {
        [_contentImageView removeFromSuperview];
        
        _contentImageView = contentImageView;
        [self addSubview:contentImageView];
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)prepareContentView {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    self.contentImageView = imageView;
}

- (void)fillWithModel:(ABImageModel *)model {
    self.contentImageView.image = model.image;
}

#pragma mark -
#pragma mark ABModelObserver

- (void)modelWillLoad:(id)model {
    ABDispatchAsyncOnMainThread(^{
        [self loadingViewVisible:YES];
    });
}

- (void)modelDidLoad:(id)model {
    ABDispatchAsyncOnMainThread(^{
        [self loadingViewVisible:NO];
        [self fillWithModel:model];
    });
}

@end
