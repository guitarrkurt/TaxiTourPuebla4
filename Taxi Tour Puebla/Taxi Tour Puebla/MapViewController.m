//
//  MapViewController.m
//  Taxi Tour Puebla
//
//  Created by Miguel Mexicano on 30/08/14.
//  Copyright (c) 2014 BUAP. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize mapView;
@synthesize mySearch;

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
 
      mapView.showsUserLocation=YES;
    self.mySearch.delegate=self;
    self.mapView.delegate=self;
    
    // Do any additional setup after loading the view.
}


-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{

    [self.mySearch resignFirstResponder];
    CLGeocoder *geocoder=[[CLGeocoder alloc]init ];
    [geocoder geocodeAddressString:self.mySearch.text completionHandler:^(NSArray *placemarks, NSError *error) {
        
        
        
        //Get nearby address
        
        CLPlacemark *placemark = [placemarks objectAtIndex:0];
        
        MKCoordinateRegion region;
        CLLocationCoordinate2D newLocation=[placemark.location coordinate];
        region.center=[(CLCircularRegion *)placemark.region center];
  
    
    
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate: newLocation];
        [annotation setTitle:self.mySearch.text];
        [self.mapView addAnnotation:annotation];
        
        
        MKMapRect mr=[self.mapView visibleMapRect];
        MKMapPoint pt=MKMapPointForCoordinate([annotation coordinate]);
        mr.origin.x = pt.x - mr.size.width * 0.5;
        mr.origin.y=pt.y-mr.size.height*0.25;
        [self.mapView setVisibleMapRect:mr animated:YES ];
    
    
      }];
    
    
}
    
    

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
  
    
    // Dispose of any resources that can be recreated.
}


- (IBAction)ChangeValueSG:(id)sender
{
   // MKMapCamera* currentCamera  = self.mapView.camera;
    
    
    switch (mySegmentControl.selectedSegmentIndex) {
        case 0:
            mapView.mapType=MKMapTypeStandard;
            break;
        case 1:
            mapView.mapType=MKMapTypeSatellite;
            
            //currentCamera.altitude  = 200.0f;
            //currentCamera.pitch     = 70.0f;
            
            //currentCamera.pitch     = 50.0f;
            
            break;
            
        case 2:
            mapView.mapType=MKMapTypeHybrid;
            break;
            
        default:
            break;
    }



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
