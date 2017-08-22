//
//  ABModel.h
//  iOSProject
//
//  Created by Andrew Boychuk on 8/10/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABObservableObject.h"

typedef NS_ENUM(NSUInteger, ABModelState) {
    ABModelDidUnloaded,
    ABModelWillLoad,
    ABModelDidLoad,
    ABModelDidFailLoading,
    ABModelStateCount
};

@protocol ABModelSaveAndDump <NSObject>

@optional
- (void)saveModel;
- (void)dumpModel;

@end

@protocol ABModelObserver <NSObject>

@optional
- (void)modelDidUnloaded:(id)model;
- (void)modelWillLoad:(id)model;
- (void)modelDidLoad:(id)model;
- (void)modelDidFailLoading:(id)model;

@end

@interface ABModel : ABObservableObject

- (void)loadModel;

//Method created for subclassing do not call it directly.
- (void)performLoading;

@end
