//
//  UIComboBoxSelector.m
//  TestComboBox
//
//  Created by Noelia on 05/07/13.
//  Copyright (c) 2013 Noelia. All rights reserved.
//
// Code in this file:
// - Noelia Sales <noelia@nubiq.es>

#import "UIComboBoxSelector.h"
#import "UITriangleView.h"

@interface UIComboBoxSelector ()

@end

@implementation UIComboBoxSelector

@synthesize father;

UITableView *table;

#pragma mark - Object lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];    
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,
                                                          self.view.frame.size.height)];
    [table setBounces:NO];
    //[table setBackgroundColor:[UIColor clearColor]];
    [table setDelegate:self];
    [table setDataSource:self];
    
    [[self view] addSubview:table];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[father textOptions] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ComboBoxCell";
    
    // Important: Don't check the nil comparisson to reload the cell everytime
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                                   reuseIdentifier:CellIdentifier];
    
    // Enable cell selection
    [cell setSelectionStyle:UITableViewCellSelectionStyleGray];

    // The colors to use depend on the combo box
    UIColor *presentColor;
    if ([father colorOptions] == nil) {
        presentColor = [UIColor blackColor];
    } else {
        presentColor = [[father colorOptions] objectAtIndex:[indexPath row]];
    }
        
    // Defining text label
    UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(0.3*tableView.frame.size.width, 0,
                                                              0.7*tableView.frame.size.width,
                                                              [tableView rowHeight])];
    [text setTextAlignment:NSTextAlignmentLeft];
    [text setText:[[father textOptions] objectAtIndex:[indexPath row]]];
    [text setBackgroundColor:[UIColor clearColor]];
    [text setTextColor:presentColor];
    
    // Defining size of the triangle view
    CGRect imageRect = CGRectMake(0.01*tableView.frame.size.width, 0,
                                  0.25*tableView.frame.size.width,
                                  [tableView rowHeight]);
    
    NSUInteger width = imageRect.size.height/4;
    NSUInteger height = imageRect.size.height/2;
    CGRect rect = CGRectMake(imageRect.size.width - (width + 10), (imageRect.size.height - height)/2,
                                   width, height);
    
    // Defining triangle view
    UIView *triangle;
    if ([father index] == [indexPath row]) {
        triangle = [[UITriangleView alloc] initWithFrame:rect
                                               withColor:presentColor withPosition:3];
    }
    
    // Adding subviews to the cell
    [cell addSubview:text];
    [cell addSubview:triangle];
    
    [cell setAutoresizesSubviews:YES];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Update info in the combo box
    [father updateIndex:[indexPath row]];
    
    if (IOS_OLDER_THAN_6) {
#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
        [self dismissModalViewControllerAnimated:YES];
#pragma GCC diagnostic warning "-Wdeprecated-declarations"
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
