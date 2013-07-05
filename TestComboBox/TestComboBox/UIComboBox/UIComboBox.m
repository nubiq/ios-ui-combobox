//
//  UIComboBox.m
//  TestComboBox
//
//  Created by Noelia on 05/07/13.
//  Copyright (c) 2013 Noelia. All rights reserved.
//
// Code in this file:
// - Noelia Sales <noelia@nubiq.es>

#import "UIComboBox.h"
#import "UIComboBoxSelector.h"

@implementation UIComboBox

UIComboBoxSelector *comboBoxSelector;
float version;

@synthesize father;
@synthesize textOptions;
@synthesize colorOptions;
@synthesize index;
@synthesize backColor;
@synthesize decorationColor;
@synthesize shadowColor;

#pragma mark - Object lifecycle

- (id)initWithFrame:(CGRect)frame withFather:(UIViewController *)controller
    withTextOptions:(NSMutableArray *)newTextOptions withColorOptions:(NSMutableArray *)newColors
  withDefaultOption:(NSUInteger)newIndex
{
    self = [super initWithFrame:frame];
    
    backColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
    decorationColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    shadowColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    
    [self setTextOptions:newTextOptions];
    [self setIndex:newIndex];
    [self setFather:controller];
    [self setColorOptions:newColors];
    
    [self setTitle:[textOptions objectAtIndex:index] forState:UIControlStateNormal];
    [self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    if (colorOptions == nil) {
        [self setTitleColor:decorationColor forState:UIControlStateNormal];
    } else {
        [self setTitleColor:[colorOptions objectAtIndex:index] forState:UIControlStateNormal];
    }
    
    [self setTitleShadowColor:shadowColor forState:UIControlStateHighlighted];
    [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [self setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    
    return self;
}


- (id)initWithFrame:(CGRect)frame withFather:(UIViewController *)controller
    withTextOptions:(NSMutableArray *)newTextOptions withDefaultOption:(NSUInteger)newIndex
{
    return [self initWithFrame:frame withFather:controller withTextOptions:newTextOptions
              withColorOptions:nil withDefaultOption:newIndex];
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{    
    NSUInteger radius = 8;
    
    // Drawing background
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [backColor CGColor]);
    
    CGContextMoveToPoint(context, rect.origin.x, rect.origin.y + radius);
    CGContextAddLineToPoint(context, rect.origin.x, rect.origin.y + rect.size.height - radius);
    CGContextAddArc(context, rect.origin.x + radius, rect.origin.y + rect.size.height - radius,
                    radius, M_PI, M_PI / 2, 1); //STS fixed
    CGContextAddLineToPoint(context, rect.origin.x + rect.size.width - radius,
                            rect.origin.y + rect.size.height);
    CGContextAddArc(context, rect.origin.x + rect.size.width - radius,
                    rect.origin.y + rect.size.height - radius, radius, M_PI / 2, 0.0f, 1);
    CGContextAddLineToPoint(context, rect.origin.x + rect.size.width, rect.origin.y + radius);
    CGContextAddArc(context, rect.origin.x + rect.size.width - radius, rect.origin.y + radius,
                    radius, 0.0f, -M_PI / 2, 1);
    CGContextAddLineToPoint(context, rect.origin.x + radius, rect.origin.y);
    CGContextAddArc(context, rect.origin.x + radius, rect.origin.y + radius, radius,
                    -M_PI / 2, M_PI, 1);
    
    CGContextFillPath(context);
    
    // Drawing a triangle
    NSUInteger width = rect.size.height/3;
    NSUInteger height = rect.size.height/5;
    CGRect circleRect = CGRectMake(rect.size.width - (width + 10), (rect.size.height - height)/2,
                                   width, height);
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, CGRectGetMinX(circleRect), CGRectGetMinY(circleRect));
    CGContextAddLineToPoint(context, CGRectGetMaxX(circleRect), CGRectGetMinY(circleRect));
    CGContextAddLineToPoint(context, CGRectGetMidX(circleRect), CGRectGetMaxY(circleRect));
    CGContextClosePath(context);
    
    if (colorOptions == nil) {
        CGContextSetFillColorWithColor(context, [decorationColor CGColor]);
    } else {
        CGContextSetFillColorWithColor(context, [[colorOptions objectAtIndex:index] CGColor]);
    }
    
    CGContextFillPath(context);
}

#pragma mark - Action

- (IBAction)buttonPressed:(id)sender
{    
    // Call modal view to edit address
    comboBoxSelector = [[UIComboBoxSelector alloc] init];
    [comboBoxSelector setFather:self];
    [comboBoxSelector setModalPresentationStyle:UIModalPresentationFormSheet];
    [comboBoxSelector setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    
    
    if (IOS_OLDER_THAN_6) {
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
        [father presentModalViewController:comboBoxSelector animated:YES];
#pragma GCC diagnostic warning "-Wdeprecated-declarations"
    } else {
        [father presentViewController:comboBoxSelector animated:YES completion:nil];
    }
}

- (void)updateIndex:(NSUInteger)newIndex
{
    [self setIndex:newIndex];
    [self setTitle:[textOptions objectAtIndex:newIndex] forState:UIControlStateNormal];
    if (colorOptions != nil) {
        [self setTitleColor:[colorOptions objectAtIndex:index] forState:UIControlStateNormal];
    }
    [self setNeedsDisplay];
}

@end
