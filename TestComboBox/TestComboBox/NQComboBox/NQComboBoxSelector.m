//
//  UIComboBoxSelector.m
//  TestComboBox
//
//  Created by Noelia on 05/07/13.
//  Copyright (c) 2013,2014 NubiQ Inc.
//
// Code in this file:
// - Noelia Sales <noelia@nubiq.es>
// - Abranhanfer <abrahan@nubiq.es>

#import "NQComboBoxSelector.h"
#import "NQTriangleView.h"

@interface NQComboBoxSelector ()

@end

@implementation NQComboBoxSelector

@synthesize father, frame, heigthRow;

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

- (void) loadView
{
    self.view = [[UIView alloc] initWithFrame:self.frame];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void) viewWillAppear:(BOOL)animated
{
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,
                                                          self.view.frame.size.height) style:UITableViewStylePlain];
    [table setBounces:NO];
    [table setDelegate:self];
    [table setDataSource:self];
    [[self view] addSubview:table];
    [table setUserInteractionEnabled:true];
    [table setSeparatorInset:UIEdgeInsetsZero];
    [table setBackgroundColor:[UIColor clearColor]];
    [table setRowHeight:self.heigthRow];
    
    table.layer.masksToBounds = YES;
    table.layer.cornerRadius = 5;
    table.layer.borderWidth = 1;
    table.layer.borderColor = [[[father colorOptions] objectAtIndex:[father index]] CGColor];
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
    UIColor *backgroundColor;
    if ([father colorOptions] == nil) {
        backgroundColor = [UIColor whiteColor];
        presentColor = [UIColor blackColor];
    } else {
       presentColor = [[father colorOptions] objectAtIndex:[indexPath row]];
       backgroundColor = [UIColor whiteColor];
    }
    
    
    [cell setBackgroundColor:backgroundColor];
    // Defining text label
    UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(.3*tableView.frame.size.width, 0,
                                                              .7*tableView.frame.size.width,
                                                              [table rowHeight])];
    [text setTextAlignment:NSTextAlignmentLeft];
    [text setText:[[father textOptions] objectAtIndex:[indexPath row]]];
    [text setBackgroundColor:[UIColor clearColor]];
    
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
        triangle = [[NQTriangleView alloc] initWithFrame:rect
                                               withColor:backgroundColor withPosition:3];
        [cell addSubview:triangle];
        [text setTextColor:backgroundColor];
        [cell setBackgroundColor:presentColor];
    } else {
        [text setTextColor:presentColor];
        [cell setBackgroundColor:backgroundColor];
    }
    
    // Adding subviews to the cell
    [cell addSubview:text];
    
    
    [cell setAutoresizesSubviews:YES];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Update info in the combo box
    [father updateIndex:[indexPath row]];
    [self.view removeFromSuperview];
}

// Allow autorotate in iOS 5.1
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
