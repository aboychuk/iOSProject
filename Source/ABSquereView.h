//
//  ABSquereView.h
//  iOSProject
//
//  Created by Andrew Boychuk on 7/8/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ABCompletionBlock)(BOOL);

typedef NS_ENUM(NSUInteger, ABSquerePosition) {
    ABSquerePositionTopLeft,
    ABSquerePositionTopRight,
    ABSquerePositionBottomRight,
    ABSquerePositionBottomLeft,
    ABSquerePositionCount
};

@interface ABSquereView : UIView
@property (nonatomic, strong)   IBOutlet UIView     *squere;
@property (nonatomic, assign)   ABSquerePosition    squerePosition;

- (void)setSquerePosition:(ABSquerePosition)squerePosition;
- (void)setSquerePosition:(ABSquerePosition)squerePosition
                 animated:(BOOL)animated;
- (void)setSquerePosition:(ABSquerePosition)squerePosition
                 animated:(BOOL)animated
        completionHandler:(ABCompletionBlock)completionHandler;

- (void)startClockwiseMoving;
- (void)startRandomMoving;
- (void)startCycleMove;

@end
