//
//  ABLabelView.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/7/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABLabelView.h"

@implementation ABLabelView

#pragma mark
#pragma mark Public Methods

- (void)awakeFromNib {
    [super awakeFromNib];
    self.label.text = @"PAPA";
}

@end
