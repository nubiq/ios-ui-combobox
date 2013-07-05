//
//  UIComboBox.h
//  TestComboBox
//
//  Created by Noelia on 05/07/13.
//  Copyright (c) 2013 Noelia. All rights reserved.
//
// Code in this file:
// - Noelia Sales <noelia@nubiq.es>

#import <UIKit/UIKit.h>

#define IOS_OLDER_THAN_6 ( [[[UIDevice currentDevice] systemVersion] floatValue] < 6.0)

@interface UIComboBox : UIButton

@property UIViewController *father;

- (id)initWithFrame:(CGRect)frame withFather:(UIViewController *)controller
    withTextOptions:(NSMutableArray *)textOptions withDefaultOption:(NSUInteger)index;

@end
