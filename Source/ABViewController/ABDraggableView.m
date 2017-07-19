//
//  ABDraggableView.m
//  iOSProject
//
//  Created by Andrew Boychuk on 7/12/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "ABDraggableView.h"

static NSUInteger ABTouchCount          = 1;
static NSTimeInterval ABTimeIntetval    = 1.0;

@interface ABDraggableView ()
@property (nonatomic, retain)   UITouch *leadingTouch;

//- (void)processTouches:(NSSet *)touches;
- (void)moveToLocation:(CGPoint)location;

@end

@implementation ABDraggableView

#pragma mark
#pragma mark Initializations and Deallocations

- (void)awakeFromNib {
    [super awakeFromNib];
    
    CALayer *layer = self.layer;
    layer.borderColor = [[UIColor blackColor] CGColor];
    layer.borderWidth = 2.0;
    layer.cornerRadius = CGRectGetWidth(self.frame) / 2;
}


#pragma mark
#pragma mark Interface Handling

- (IBAction)onPan:(UIPanGestureRecognizer *)sender {
    [self moveToLocation:[sender translationInView:self.superview]];
}

#pragma mark
#pragma mark Touch Handling

//- (void)touchesBegan:(NSSet<UITouch *> *)touches
//           withEvent:(UIEvent *)event
//{
//    self.leadingTouch = [touches anyObject];
//    
//    [self processTouches:touches];
//}
//
//- (void)touchesMoved:(NSSet<UITouch *> *)touches
//           withEvent:(UIEvent *)event
//{
//    [self processTouches:touches];
//}
//
//- (void)touchesEnded:(NSSet<UITouch *> *)touches
//           withEvent:(UIEvent *)event
//{
//    [self processTouches:touches];
//    
//    self.leadingTouch = nil;
//}
//
//- (void)touchesCancelled:(NSSet<UITouch *> *)touches
//               withEvent:(UIEvent *)event
//{
//    [self processTouches:touches];
//    
//    self.leadingTouch = nil;
//}

#pragma mark
#pragma mark Private Methods

//- (void)processTouches:(NSSet *)touches {
//    if ([touches count] != ABTouchCount) {
//        return;
//    }
//    CGFloat random = (CGFloat)arc4random() / UINT32_MAX;
//    CGFloat scale = random;
//    NSLog(@"%f", scale);
//    
//    CGAffineTransform transform = CGAffineTransformIdentity;
//    transform = CGAffineTransformConcat(transform, CGAffineTransformMakeScale(scale, scale));
//    transform = CGAffineTransformConcat(transform, CGAffineTransformMakeRotation(random * 2 * M_PI));
//
//    UITouch *touch = self.leadingTouch;
//    CGPoint location = [touch locationInView:self.superview];
//    
//    [UIView animateWithDuration:ABTimeIntetval animations:^{
//        CGRect frame = self.frame;
//        frame.origin = location;
//        self.frame = frame;
//        self.transform = transform;
//    }];
//    
//}

- (void)moveToLocation:(CGPoint)location {
    CGRect frame = self.frame;
    frame.origin = location;
    CGFloat dimension = location.x / 50;
    frame.size = CGSizeMake(dimension * 160, dimension * 160);
    
    [UIView animateWithDuration:ABTimeIntetval
                     animations:^{
                         self.frame = frame;
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.layer.cornerRadius = CGRectGetWidth(self.frame) / 2;
}


@end
