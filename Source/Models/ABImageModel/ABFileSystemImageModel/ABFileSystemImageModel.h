//
//  ABFileSystemImageModel.h
//  iOSProject
//
//  Created by Andrew Boychuk on 8/30/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABImageModel.h"

@interface ABFileSystemImageModel : ABImageModel

- (instancetype)initWithUrl:(NSURL *)url;

@end
