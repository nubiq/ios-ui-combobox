//
//  UIComboBoxSelector.h
//  TestComboBox
//
//  Created by Noelia on 05/07/13.
//  Copyright (c) 2013 Noelia. All rights reserved.
//
// Code in this file:
// - Noelia Sales <noelia@nubiq.es>

#import <UIKit/UIKit.h>
#import "UIComboBox.h"

@interface UIComboBoxSelector : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property UIComboBox *father;

@end
