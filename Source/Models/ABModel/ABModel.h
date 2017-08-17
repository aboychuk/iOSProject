//
//  ABModel.h
//  iOSProject
//
//  Created by Andrew Boychuk on 8/10/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABObservableObject.h"

typedef NS_ENUM(NSUInteger, ABModelState) {
    ABModelUnloaded,
    ABModelLoading,
    ABModelLoaded,
    ABModelLoadingFailed,
    ABModelStateCount
};

@protocol ABModelObserver <NSObject>

@optional
- (void)modelDidUnloaded:(id)model;
- (void)modelWillLoad:(id)model;
- (void)modelDidLoad:(id)model;
- (void)modelDidFailLoading:(id)model;

@end

@interface ABModel : ABObservableObject

- (void)load;

//Method created for subclassing do not call it directly.
- (void)performLoading;

@end
