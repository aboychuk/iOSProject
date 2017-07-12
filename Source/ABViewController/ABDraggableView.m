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

- (void)processTouches:(NSSet *)touches;

@end

@implementation ABDraggableView

#pragma mark
#pragma mark Touch Handling

- (void)touchesBegan:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event
{
    self.leadingTouch = [touches anyObject];
    
    [self processTouches:touches];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event
{
    [self processTouches:touches];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event
{
    [self processTouches:touches];
    
    self.leadingTouch = nil;
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches
               withEvent:(UIEvent *)event
{
    [self processTouches:touches];
    
    self.leadingTouch = nil;
}

#pragma mark
#pragma mark Private Methods

- (void)processTouches:(NSSet *)touches {
    if ([touches count] != ABTouchCount) {
        return;
    }
    CGFloat random = (CGFloat)arc4random() / UINT32_MAX;
    CGFloat scale = random;
    NSLog(@"%f", scale);
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformConcat(transform, CGAffineTransformMakeScale(scale, scale));
    transform = CGAffineTransformConcat(transform, CGAffineTransformMakeRotation(random * 2 * M_PI));

    UITouch *touch = self.leadingTouch;
    CGPoint location = [touch locationInView:self.superview];
    
    [UIView animateWithDuration:ABTimeIntetval animations:^{
        CGRect frame = self.frame;
        frame.origin = location;
        self.frame = frame;
        self.transform = transform;
    }];
    
}


@end