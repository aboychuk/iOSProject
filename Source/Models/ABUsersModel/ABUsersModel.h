//
//  ABUsersModel.h
//  iOSProject
//
//  Created by Andrew Boychuk on 8/14/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABArrayModel.h"

@interface ABUsersModel : ABArrayModel <ABModelSaveAndDump>

- (void)saveModel;
- (void)dumpModel;
- (void)performLoading;

@end
