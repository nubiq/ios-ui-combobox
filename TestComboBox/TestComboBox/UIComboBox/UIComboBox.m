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

- (id)initWithFrame:(CGRect)frame withFather:(UIViewController *)controller
    withTextOptions:(NSMutableArray *)textOptions withDefaultOption:(NSUInteger)index
{
    self = [super initWithFrame:frame];
    
    [self setTitle:[textOptions objectAtIndex:index] forState:UIControlStateNormal];
    [self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self setFather:controller];
    [self setTintColor:[UIColor blueColor]];
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextBeginPath(ctx);
    CGContextSetLineWidth(ctx, 3.0);
    CGContextMoveToPoint(ctx,rect.origin.x, rect.origin.y);
    CGContextAddLineToPoint(ctx, rect.size.width,rect.size.height);
    CGContextDrawPath(ctx,kCGPathStroke);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

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
