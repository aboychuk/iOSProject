//
//  ABImageView.h
//  iOSProject
//
//  Created by Andrew Boychuk on 8/17/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABView.h"
#import "ABModel.h"

@class ABImageModel;

@interface ABImageView : ABView <ABModelObserver>
@property (nonatomic, strong)   ABImageModel    *imageModel;
@property (nonatomic, strong)   UIImageView     *contentImageView;

@end
