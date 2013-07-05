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
    
    int tableWidth = tableView.frame.size.width;
    
    // Defining labels
    //UILabel *image = [[UILabel alloc] initWithFrame:CGRectMake(0.01*tableWidth, 0, 0.25*tableWidth,
    //                                                          [tableView rowHeight])];
    UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(0.3*tableWidth, 0, 0.7*tableWidth,
                                                              [tableView rowHeight])];
    [text setTextAlignment:NSTextAlignmentLeft];
    [text setText:[[father textOptions] objectAtIndex:[indexPath row]]];
    [text setBackgroundColor:[UIColor clearColor]];
    
    
    CGRect imageRect = CGRectMake(0.01*tableWidth, 0, 0.25*tableWidth,
                                  [tableView rowHeight]);
    
    // Draw triangle
    NSUInteger width = imageRect.size.height/4;
    NSUInteger height = imageRect.size.height/2;
    CGRect rect = CGRectMake(imageRect.size.width - (width + 10), (imageRect.size.height - height)/2,
                                   width, height);
    
    UIView *triangle;
    /*
    if ([father colorOptions] == nil) {
        triangle = triangle = [[UITriangleView alloc] initWithFrame:rect
                                                          withColor:[father decorationColor] withPosition:3];
    } else {
        triangle = triangle = [[UITriangleView alloc] initWithFrame:rect
                                                          withColor:[[father colorOptions] objectAtIndex:[indexPath row]]
                                                       withPosition:3];
    }
    
    if ([father index] == [indexPath row]) {
        [text setFont:[UIFont boldSystemFontOfSize:20]];
    } else {
        [text setFont:[UIFont systemFontOfSize:20]];
    }*/
    UIColor *presentColor;
    if ([father colorOptions] == nil) {
        presentColor = [UIColor blackColor];
    } else {
        presentColor = [[father colorOptions] objectAtIndex:[indexPath row]];
    }
    
    if ([father index] == [indexPath row]) {
        triangle = [[UITriangleView alloc] initWithFrame:rect
                                               withColor:presentColor withPosition:3];
    }
    
    [text setTextColor:presentColor];
    
    // Adding subviews to the cell
    [cell addSubview:text];
    [cell addSubview:triangle];
    
    [cell setAutoresizesSubviews:YES];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [father updateIndex:[indexPath row]];
    
    if (IOS_OLDER_THAN_6) {
        [self dismissModalViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
