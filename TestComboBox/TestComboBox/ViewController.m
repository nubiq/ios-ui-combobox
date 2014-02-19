//
//  ViewController.m
//  TestComboBox
//
//  Created by Noelia on 04/07/13.
//  Copyright (c) 2013 Noelia. All rights reserved.
//

#import "ViewController.h"
#import "NQComboBox.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NQComboBox *comboBox = [[NQComboBox alloc] initWithFrame:CGRectMake(200, 100, 140, 40)
                                                  withFather:self
                                             withTextOptions:[NSMutableArray arrayWithObjects:@"Object 1",@"Object 2", @"Object 3", nil]
                                           withDefaultOption:0];
    
    NQComboBox *comboBox2 = [[NQComboBox alloc] initWithFrame:CGRectMake(400, 100, 140, 40)
                                                   withFather:self
                                              withTextOptions:[NSMutableArray arrayWithObjects:@"Object 4",@"Object 5", @"Object 6", nil]
                                             withColorOptions:[NSMutableArray arrayWithObjects:[UIColor redColor], [UIColor blueColor], [UIColor yellowColor], nil]
                                            withDefaultOption:0];
    
    [[self view] addSubview:comboBox];
    [[self view] addSubview:comboBox2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
