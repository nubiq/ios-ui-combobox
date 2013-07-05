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
@synthesize index;

- (id)initWithFrame:(CGRect)frame withFather:(UIViewController *)controller
    withTextOptions:(NSMutableArray *)newTextOptions withDefaultOption:(NSUInteger)newIndex
{
    self = [super initWithFrame:frame];
    
    [self setTextOptions:newTextOptions];
    [self setIndex:newIndex];
    [self setFather:controller];
    
    [self setTitle:[textOptions objectAtIndex:index] forState:UIControlStateNormal];
    [self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [self setTitleShadowColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [self setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
    
    return self;
}

- (void)drawRect:(CGRect)rect
{    
    NSUInteger radius = 8;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(context, 0.2, 0.2, 0.2, 1);
    
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
    
    // Draw triangle
    NSUInteger width = rect.size.height/3;
    NSUInteger height = rect.size.height/5;
    CGRect circleRect = CGRectMake(rect.size.width - (width + 10), (rect.size.height - height)/2,
                                   width, height);
    
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, CGRectGetMinX(circleRect), CGRectGetMinY(circleRect));
    CGContextAddLineToPoint(context, CGRectGetMaxX(circleRect), CGRectGetMinY(circleRect));
    CGContextAddLineToPoint(context, CGRectGetMidX(circleRect), CGRectGetMaxY(circleRect));
    CGContextClosePath(context);
    
    CGContextSetRGBFillColor(context, 1, 1, 0, 1);
    CGContextFillPath(context);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)updateIndex:(NSUInteger)newIndex
{
    [self setIndex:newIndex];
    [self setTitle:[textOptions objectAtIndex:newIndex] forState:UIControlStateNormal];
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
        [father presentModalViewController:comboBoxSelector animated:YES];
    } else {
        [father presentViewController:comboBoxSelector animated:YES completion:nil];
    }
}

@end
