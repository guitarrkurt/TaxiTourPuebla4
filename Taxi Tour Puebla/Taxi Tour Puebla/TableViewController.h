//
//  TableViewController.h
//  Taxi Tour Puebla
//
//  Created by Miguel Mexicano on 30/08/14.
//  Copyright (c) 2014 BUAP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    NSArray *array;
    
    NSArray *subcomida;

}


@property(nonatomic, strong)IBOutlet NSArray *array;
@property(nonatomic, strong)IBOutlet NSArray *subcomida;

@end
