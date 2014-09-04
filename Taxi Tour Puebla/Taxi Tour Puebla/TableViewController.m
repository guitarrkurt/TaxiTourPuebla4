//
//  TableViewController.m
//  Taxi Tour Puebla
//
//  Created by Miguel Mexicano on 30/08/14.
//  Copyright (c) 2014 BUAP. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

@synthesize array;
@synthesize subcomida;

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
    array= [[NSArray alloc]initWithObjects:@"Hotel",@"Comida",@"Diversion",@"Algo màs...", nil ];
    subcomida= [[NSArray alloc]initWithObjects:@"Comida China",@"Comida Japonesa",@"Comida Mexicana",@"Comida Vegetariana", nil ];
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [array count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell)
       cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text=[array objectAtIndex:[indexPath row]];
    cell.detailTextLabel.text =[subcomida objectAtIndex:[indexPath row]];
    cell.imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[array objectAtIndex:[indexPath row]]]];
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{


    NSString *mesage=[NSString stringWithFormat:@"Seleccionaste %@",[array objectAtIndex:indexPath.row]];

    UIAlertView *alerta= [[UIAlertView alloc]initWithTitle:@"Alerta" message:mesage delegate:self cancelButtonTitle:@"cerrar" otherButtonTitles:nil, nil];
    [alerta show];
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
