//
//  ElCantoRuisenorViewController.m
//  Taxi Tour Puebla
//
//  Created by guitarrkurt on 03/09/14.
//  Copyright (c) 2014 BUAP. All rights reserved.
//

#import "ElCantoRuisenorViewController.h"

@interface ElCantoRuisenorViewController ()

@end

@implementation ElCantoRuisenorViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeView:(id)sender {
    
        [self dismissModalViewControllerAnimated:YES];
    
}
@end
