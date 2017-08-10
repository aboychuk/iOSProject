//
//  ABModel.h
//  iOSProject
//
//  Created by Andrew Boychuk on 8/10/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABObservableObject.h"

typedef NS_ENUM(NSUInteger, ABModelState) {
    ABModelLoading,
    ABModelLoaded,
    ABModelUnloaded,
    ABModelLoadingFailed,
    ABModelStateCount
};

@protocol ABModelObserver <NSObject>

@optional
- (void)modelLoading:(id)model;
- (void)modelDidLoad:(id)model;
- (void)modelUnloaded:(id)model;
- (void)modelLoadingFailed:(id)model;

@end

@interface ABModel : ABObservableObject

- (void)load;

//Method created for subclassing do not call it directly.
- (void)processLoadingInBackground;

@end
