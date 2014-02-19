//
//  UIComboBoxSelector.h
//  TestComboBox
//
//  Created by Noelia on 05/07/13.
//  Copyright (c) 2013,2014 NubiQ Inc.
//
// Code in this file:
// - Noelia Sales <noelia@nubiq.es>
// - Abranhanfer <abrahan@nubiq.es>

#import <UIKit/UIKit.h>
#import "NQComboBox.h"

@interface NQComboBoxSelector : UIViewController <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>

/**
 * Link to the combo box itself.
 */
@property NQComboBox *father;

@property (nonatomic) CGRect frame;

@property (nonatomic) int heigthRow;

@end
