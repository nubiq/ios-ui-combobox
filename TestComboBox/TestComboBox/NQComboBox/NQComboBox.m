//
//  UIComboBox.m
//  TestComboBox
//
//  Created by Noelia on 05/07/13.
//  Copyright (c) 2013,2014 NubiQ Inc.
//
// Code in this file:
// - Noelia Sales <noelia@nubiq.es>
// - Abranhanfer <abrahan@nubiq.es>

#import "NQComboBox.h"
#import "NQComboBoxSelector.h"

@implementation NQComboBox

NQComboBoxSelector *comboBoxSelector;
float version;

@synthesize father;
@synthesize textOptions;
@synthesize colorOptions;
@synthesize index;
@synthesize backColor;
@synthesize decorationColor;
@synthesize shadowColor;
@synthesize selfFrame;

#pragma mark - Object lifecycle

- (id)initWithFrame:(CGRect)frame withFather:(UIViewController *)controller
    withTextOptions:(NSMutableArray *)newTextOptions withColorOptions:(NSMutableArray *)newColors
  withDefaultOption:(NSUInteger)newIndex
{
    self = [super initWithFrame:frame];
    self.selfFrame = frame;
    
    backColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
    //decorationColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    decorationColor = [UIColor colorWithRed:162.0/255.0 green:162.0/255.0 blue:162.0/255.0 alpha:1];
    shadowColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    
    [self setTextOptions:newTextOptions];
    [self setIndex:newIndex];
    [self setFather:controller];
    [self setColorOptions:newColors];
    
    [self setTitle:[textOptions objectAtIndex:index] forState:UIControlStateNormal];
    [self addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
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
    if (colorOptions == nil) {
        CGContextSetFillColorWithColor(context, [backColor CGColor]);
    } else {
        CGContextSetFillColorWithColor(context, [[colorOptions objectAtIndex:index] CGColor]);
    }
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
    
    
    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);

    
    CGContextFillPath(context);
}

#pragma mark - Action

- (IBAction)buttonPressed:(id)sender
{
    CGRect rectToDraw = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.selfFrame.size.width, self.selfFrame.size.height * [textOptions count]);
    comboBoxSelector = [[NQComboBoxSelector alloc] init];
    [comboBoxSelector setFather:self];
    [comboBoxSelector setFrame:rectToDraw];
    [comboBoxSelector setHeigthRow:self.selfFrame.size.height];
   
    [self.father addChildViewController:comboBoxSelector];
    [self.father.view addSubview:[comboBoxSelector view]];
}

- (void)updateIndex:(NSUInteger)newIndex
{
    [self setIndex:newIndex];
    [self setTitle:[textOptions objectAtIndex:newIndex] forState:UIControlStateNormal];
    
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setNeedsDisplay];
}

@end
