//
//  ABViewController.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/7/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABViewController.h"

#import "ABLabelView.h"

@interface ABViewController ()
@property (nonatomic, readonly) ABLabelView *labelView;

@end

@implementation ABViewController

#pragma mark
#pragma mark Accessors

- (void)setData:(NSString *)data {
    if (_data != data) {
        _data = data;
    }
    
    self.labelView.label.text = data;
}

- (ABLabelView *)labelView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[ABLabelView class]]) {
        return (ABLabelView *)self.view;
    }
    
    return nil;
}

#pragma mark
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = self.data;
    
//    [[(ABLabelView *) [self view] label] setText:@"PAPA"];
    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    
//    label.text = @"AABAVB";
//    label.backgroundColor = [UIColor blackColor];
//    label.textColor = [UIColor whiteColor];
//    
//    self.view.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
//    self.view.opaque = NO;
//    
//    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
