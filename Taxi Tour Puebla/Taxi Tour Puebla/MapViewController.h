//
//  MapViewController.h
//  Taxi Tour Puebla
//
//  Created by Miguel Mexicano on 30/08/14.
//  Copyright (c) 2014 BUAP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate,UISearchBarDelegate>
{
    MKMapView *mapView;
    
    IBOutlet UISegmentedControl *mySegmentControl;

}

- (IBAction)ChangeValueSG:(id)sender;


@property (nonatomic, retain)IBOutlet MKMapView *mapView;

@property (strong, nonatomic) IBOutlet UISearchBar *mySearch;


@end
