//
//  ABArrayModelChangeMove.h
//  iOSProject
//
//  Created by Andrew Boychuk on 8/7/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABArrayModelChange.h"

@interface ABArrayModelChangeMove : ABArrayModelChange
@property (nonatomic, assign)   NSUInteger  index;

- (instancetype)initWithSourceIndex:(NSUInteger)index
                   destinationIndex:(NSUInteger)index;

- (void)updateTableView:(UITableView *)tableView
              inSection:(NSUInteger)section
       withRowAnimation:(UITableViewRowAnimation)animation;

@end
