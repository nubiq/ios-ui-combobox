//
//  UITriangleView.h
//  TestComboBox
//
//  Created by Noelia on 05/07/13.
//  Copyright (c) 2013,2014 Nubiq Inc.
//
// Code in this file:
// - Noelia Sales <noelia@nubiq.es>
// - Abranhanfer <abrahan@nubiq.es>

#import <UIKit/UIKit.h>

@interface UITriangleView : UIView

/**
 * Color of the triangle.
 */
@property UIColor *mainColor;

/**
 * Position of the triangle.
 *
 * 0: Looking down
 * 1: Looking left
 * 2: Looking up
 * 3: Looking right
 */
@property NSUInteger position;

/**
 * Simple contructor with a given frame.
 */
- (id)initWithFrame:(CGRect)frame;

/**
 * It creates a new triangle view within a given frame, with a given color and a given position.
 */
- (id)initWithFrame:(CGRect)frame withColor:(UIColor *)color withPosition:(NSUInteger)newPosition;

@end
