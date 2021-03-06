//
//  ABArrayModelChangeAdd.m
//  iOSProject
//
//  Created by Andrew Boychuk on 8/7/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABArrayModelChangeAdd.h"

#import "UITableView+ABExtension.h"

@interface ABArrayModelChangeAdd ()
@property (nonatomic, assign)   NSUInteger  index;

@end

@implementation ABArrayModelChangeAdd

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithIndex:(NSUInteger)index {
    self = [super init];
    if (self) {
        self.index = index;
    }
    
    return self;
}

#pragma mark -
#pragma mark ABArrayModelChange (UITableView)

- (void)updateTableView:(UITableView *)tableView
              inSection:(NSUInteger)section
       withRowAnimation:(UITableViewRowAnimation)animation
{
    NSIndexPath *index = [NSIndexPath indexPathForRow:self.index inSection:section];
    NSArray *indexArray = @[index];
    [tableView updateWithBlock:^{
        [tableView insertRowsAtIndexPaths:indexArray
                         withRowAnimation:animation];
    }];
}

@end
