//
//  UIComboBox.h
//  TestComboBox
//
//  Created by Noelia on 05/07/13.
//  Copyright (c) 2013,2014 NubiQ Inc.
//
// Code in this file:
// - Noelia Sales <noelia@nubiq.es>
// - Abranhanfer <abrahan@nubiq.es>

#import <UIKit/UIKit.h>

@interface UIComboBox : UIButton

#pragma mark - Attributes
/**
 * Link to the view controller in which was define the present combo box.
 */
@property UIViewController *father;

/**
 * Array of strings with all available options.
 */
@property NSMutableArray *textOptions;

/**
 * Array of UIColors with a color for each text options. It can be nil (then we
 * will use no colors).
 */
@property NSMutableArray *colorOptions;

/**
 * Reference to the present selected option.
 */
@property NSUInteger index;

/**
 * Background color of the combo box appearance.
 */
@property UIColor *backColor;

/**
 * Main color of the combo box appearance.
 */
@property UIColor *decorationColor;

/**
 * Secondary color of the combo box appearance.
 */
@property UIColor *shadowColor;


@property (nonatomic) CGRect selfFrame;

#pragma mark - Methods

/**
 * It creates a new combo box with a given frame, a given controller, some text options
 * and a default text option.
 */
- (id)initWithFrame:(CGRect)frame withFather:(UIViewController *)controller
    withTextOptions:(NSMutableArray *)textOptions withDefaultOption:(NSUInteger)index;

/**
 * It creates a new combo box with all elements, and some color options.
 */
- (id)initWithFrame:(CGRect)frame withFather:(UIViewController *)controller
    withTextOptions:(NSMutableArray *)newTextOptions withColorOptions:(NSMutableArray *)newColors
  withDefaultOption:(NSUInteger)newIndex;

/**
 * Method launched when the selector updates the selected option.
 */
- (void)updateIndex:(NSUInteger)newIndex;

@end
