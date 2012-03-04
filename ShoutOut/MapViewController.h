//
//  MapViewController.h
//  ShoutOut
//
//  Created by Kevin Ho on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController<MKMapViewDelegate> {
    MKMapView * mapView;
    CLGeocoder * geoCoder;
}

@property(strong, nonatomic) NSMutableArray *shoutsArray;

-(void)populateWithEvents:(NSArray*)allShouts;

@end
