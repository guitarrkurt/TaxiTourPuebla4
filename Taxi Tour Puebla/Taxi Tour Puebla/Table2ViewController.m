//
//  Table2ViewController.m
//  Taxi Tour Puebla
//
//  Created by Miguel Mexicano on 30/08/14.
//  Copyright (c) 2014 BUAP. All rights reserved.
//

#import "Table2ViewController.h"

@interface Table2ViewController ()

@end

@implementation Table2ViewController
@synthesize Tabla2;



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
    [self.Tabla2 setDataSource:self];
    [self.Tabla2 setDelegate:self];
    
    
    content = @[@"Hotel",
                @"Comida",
                @"Nueva York",
                @"Buenos Aires",
                @"Madrid",
                @"Berlin",
                @"Londres",
                @"Moscú",
                @"Hong Kong",
                @"Tokio",
                @"Melbourne"];
    
    // Do any additional setup after loading the view.
}



- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [content count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"myCell"];
    }
    
    
    NSString *cityName = [content objectAtIndex:indexPath.row];
    [cell.textLabel setText:cityName];
    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Seleccionaste el indice: %i", indexPath.row);
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
