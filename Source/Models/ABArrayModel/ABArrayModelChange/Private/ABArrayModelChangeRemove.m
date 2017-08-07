//
//  ABArrayModelChangeRemove.m
//  iOSProject
//
//  Created by Andrew Boychuk on 8/7/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABArrayModelChangeRemove.h"

@interface ABArrayModelChangeRemove ()
@property (nonatomic, assign)   NSUInteger  index;

@end

@implementation ABArrayModelChangeRemove

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
    
    [tableView beginUpdates];
    [tableView deleteRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationAutomatic];
    [tableView endUpdates];
}

@end
