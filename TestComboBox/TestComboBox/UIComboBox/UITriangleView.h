//
//  UITriangleView.h
//  TestComboBox
//
//  Created by Noelia on 05/07/13.
//  Copyright (c) 2013 Noelia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITriangleView : UIView

@property UIColor *mainColor;

@property NSUInteger position;

- (id)initWithFrame:(CGRect)frame;
- (id)initWithFrame:(CGRect)frame withColor:(UIColor *)color withPosition:(NSUInteger)newPosition;

@end
