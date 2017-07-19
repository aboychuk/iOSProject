//
//  ABDraggableView.h
//  iOSProject
//
//  Created by Andrew Boychuk on 7/12/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABDraggableView : UIView
@property (nonatomic, strong) IBOutlet UIGestureRecognizer*     recognizer;

- (IBAction)onPan:(UIPanGestureRecognizer *)sender;

@end
