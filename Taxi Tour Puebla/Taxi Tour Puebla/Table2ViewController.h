//
//  Table2ViewController.h
//  Taxi Tour Puebla
//
//  Created by Miguel Mexicano on 30/08/14.
//  Copyright (c) 2014 BUAP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Table2ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
NSArray *content;

}


@property (strong, nonatomic) IBOutlet UITableView *Tabla2;


@end
