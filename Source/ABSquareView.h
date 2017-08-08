//
//  ABSquareView.h
//  iOSProject
//
//  Created by Andrew Boychuk on 7/8/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ABCompletionBlock)(BOOL);

typedef NS_ENUM(NSUInteger, ABSquarePosition) {
    ABSquarePositionTopLeft,
    ABSquarePositionTopRight,
    ABSquarePositionBottomRight,
    ABSquarePositionBottomLeft,
    ABSquarePositionCount
};

@interface ABSquareView : UIView
@property (nonatomic, strong)   IBOutlet UIView     *squere;
@property (nonatomic, assign)   ABSquarePosition    squarePosition;

- (void)setSquarePosition:(ABSquarePosition)squarePosition;
- (void)setSquarePosition:(ABSquarePosition)squarePosition
                 animated:(BOOL)animated;
- (void)setSquarePosition:(ABSquarePosition)squarePosition
                 animated:(BOOL)animated
        completionHandler:(ABCompletionBlock)completionHandler;

- (void)startClockwiseMoving;
- (void)startRandomMoving;
- (void)startCycleMove;

@end
