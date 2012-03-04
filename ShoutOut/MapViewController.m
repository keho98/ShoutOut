//
//  MapViewController.m
//  ShoutOut
//
//  Created by Kevin Ho on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"
#import "ShoutFetcher.h"
#import "Shout.h"

@implementation MapViewController

@synthesize shoutsArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        shoutsArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    mapView.showsUserLocation=TRUE;
    mapView.mapType=MKMapTypeHybrid;
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta=0.025;
    span.longitudeDelta=0.025;
    CLLocationCoordinate2D location = mapView.userLocation.coordinate;
    //NSLog(@"%f, %f", location.latitude, location.longitude);
    location.latitude = 37.7793;
    location.longitude = -122.4192;
    
    NSString * mylong = [NSString stringWithFormat:@"%f", location.longitude];
    NSString * mylat = [NSString stringWithFormat:@"%f", location.latitude];
    
    
    NSMutableDictionary *testDictionary = [[NSMutableDictionary alloc] init];
    [testDictionary setObject:@"12" forKey:@"id"];
    [testDictionary setObject:@"Hobo" forKey:@"title"];
    [testDictionary setObject:@"He's playing a shiny guitar!" forKey:@"description"];
    [testDictionary setObject:@"20" forKey:@"popularity"];
    [testDictionary setObject:@"37.7793" forKey:@"latitude"];
    [testDictionary setObject:@"-122.4192" forKey:@"longitude"];
    [testDictionary setObject:@"Sat, 03 Mar 2012 23:16:37 UTC +00:00" forKey:@"created_at"];
    [testDictionary setObject:@"Sat, 03 Mar 2012 23:16:37 UTC +00:00" forKey:@"updated_at"];
    
    NSMutableDictionary *testDictionary2 = [[NSMutableDictionary alloc] init];
    [testDictionary2 setObject:@"13" forKey:@"id"];
    [testDictionary2 setObject:@"Car Crash" forKey:@"title"];
    [testDictionary2 setObject:@"Ouch!" forKey:@"description"];
    [testDictionary2 setObject:@"10" forKey:@"popularity"];
    [testDictionary2 setObject:@"37.7795" forKey:@"latitude"];
    [testDictionary2 setObject:@"-122.4193" forKey:@"longitude"];
    [testDictionary2 setObject:@"Sat, 03 Mar 2012 23:16:37 UTC +00:00" forKey:@"created_at"];
    [testDictionary2 setObject:@"Sat, 03 Mar 2012 23:16:37 UTC +00:00" forKey:@"updated_at"];
    
    NSArray *allShouts = [[NSArray alloc] initWithObjects:testDictionary, testDictionary2, nil];//[ShoutFetcher shoutQueryWithLongitude:mylong latitude:mylat];
    
    
    for (NSDictionary *shout in allShouts) {
        NSObject *id = [shout objectForKey:@"id"];
        NSObject *title = [shout objectForKey:@"title"];
        NSObject *description = [shout objectForKey:@"description"];
        NSObject *popularity = [shout objectForKey:@"popularity"];
        
        NSObject *latitude = [shout objectForKey:@"latitude"];
        NSObject *longitude = [shout objectForKey:@"longitude"];
        
        NSObject *createdAt = [shout objectForKey:@"created_at"];
        NSObject *updatedAt = [shout objectForKey:@"updated_at"];
        
        Shout *shout = [[Shout alloc] initShoutID:[NSNumber numberWithInt:[[NSString stringWithFormat:@"%@", id] intValue]] 
                                            title:[NSString stringWithFormat:@"%@", title] 
                                        description:[NSString stringWithFormat:@"%@", description] 
                                       popularity:[NSNumber numberWithInt:[[NSString stringWithFormat:@"%@", popularity] intValue]] 
                                         latitude:[NSNumber numberWithFloat:[[NSString stringWithFormat:@"%@", latitude] floatValue]] 
                                        longitude:[NSNumber numberWithFloat:[[NSString stringWithFormat:@"%@", longitude] floatValue]] 
                                        createdAt:[NSString stringWithFormat:@"%@", createdAt] 
                                        updatedAt:[NSString stringWithFormat:@"%@", updatedAt] ];
        
        [shoutsArray addObject:shout];
    }
    
    NSLog(@"%@", [(Shout *)[shoutsArray objectAtIndex:0] shoutID]);
    NSLog(@"%@", [(Shout *)[shoutsArray objectAtIndex:0] title]);
    NSLog(@"%@", [(Shout *)[shoutsArray objectAtIndex:0] description]);
    NSLog(@"%@", [(Shout *)[shoutsArray objectAtIndex:0] popularity]);
    NSLog(@"%f", [(Shout *)[shoutsArray objectAtIndex:0] latitude]);
    NSLog(@"%f", [(Shout *)[shoutsArray objectAtIndex:0] longitude]);
    
    region.span=span;
    region.center=location;
    //[mapView setCenterCoordinate:location];
    [mapView setRegion:region animated:FALSE];
    //[mapView regionThatFits:region];
    [self.view insertSubview:mapView atIndex:0];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
