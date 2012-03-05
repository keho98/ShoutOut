//
//  MapViewController.h
//  ShoutOut
//
//  Created by Kevin Ho on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate> {
    MKMapView * mapView;
    CLGeocoder * geoCoder;
    CLLocationCoordinate2D location;
    
    CLLocationManager *locationManager;
    
    UIView *view;
}

@property(strong, nonatomic) NSMutableArray *shoutsArray;

@property (nonatomic, retain) CLLocationManager *locationManager;

 @property (strong, nonatomic) IBOutlet UIView *viewBackground;

-(void)populateWithEvents:(NSArray*)allShouts;



@end
