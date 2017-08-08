//
//  ABImageView.h
//  iOSProject
//
//  Created by Andrew Boychuk on 8/8/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ABImageModel;

@interface ABImageView : UIView
@property (nonatomic, strong)   IBOutlet UIImageView    *contentImageView;
@property (nonatomic, strong)   ABImageModel            *imageModel;

@end
