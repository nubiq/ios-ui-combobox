//
//  UITriangleView.m
//  TestComboBox
//
//  Created by Noelia on 05/07/13.
//  Copyright (c) 2013,2014 NubiQ Inc.
//
// Code in this file:
// - Noelia Sales <noelia@nubiq.es>
// - Abranhanfer <abrahan@nubiq.es>

#import "UITriangleView.h"

@implementation UITriangleView

@synthesize mainColor;
@synthesize position;

#pragma mark - Object lifecycle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor clearColor]];
    return self;
}

- (id)initWithFrame:(CGRect)frame withColor:(UIColor *)color withPosition:(NSUInteger)newPosition
{
    self = [self initWithFrame:frame];
    
    [self setMainColor:color];
    [self setPosition:newPosition];
    
    return self;
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(context);
    switch (position) {
        case 0:
        {
            // Looking down
            CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
            CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMinY(rect));
            CGContextAddLineToPoint(context, CGRectGetMidX(rect), CGRectGetMaxY(rect));
            break;
        }
        case 1:
        {
            // Looking left
            CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMidY(rect));
            CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMinY(rect));
            CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMaxY(rect));
            break;
        }
        case 2:
        {
            // Looking up
            CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMaxY(rect));
            CGContextAddLineToPoint(context, CGRectGetMidX(rect), CGRectGetMinY(rect));
            CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMaxY(rect));
            break;
        }
        case 3:
        {
            // Looking right
            CGContextMoveToPoint(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
            CGContextAddLineToPoint(context, CGRectGetMaxX(rect), CGRectGetMidY(rect));
            CGContextAddLineToPoint(context, CGRectGetMinX(rect), CGRectGetMaxY(rect));
            break;
        }   
        default:
            break;
    }
    CGContextClosePath(context);
    CGContextSetFillColorWithColor(context, [mainColor CGColor]);
    
    CGContextFillPath(context);
}

@end
