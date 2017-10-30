//
//  ABFriendsView.h
//  iOSProject
//
//  Created by Andrew Boychuk on 19.07.17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ABView.h"

@interface ABFriendsView : ABView
@property (nonatomic, strong)   IBOutlet UITableView    *tableView;

- (void)fillWithModel;

@end
