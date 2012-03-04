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
#import "DropPin.h"

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

-(void)changeShout:(int)index shoutDict:(NSDictionary *)shout {
    ((Shout *)[shoutsArray objectAtIndex:index]).title = [NSString stringWithFormat:@"%@", [shout objectForKey:@"title"]];
    ((Shout *)[shoutsArray objectAtIndex:index]).description = [NSString stringWithFormat:@"%@", [shout objectForKey:@"description"]];
    ((Shout *)[shoutsArray objectAtIndex:index]).popularity = [[NSString stringWithFormat:@"%@", [shout objectForKey:@"popularity"]] floatValue];
    ((Shout *)[shoutsArray objectAtIndex:index]).latitude = [[NSString stringWithFormat:@"%@", [shout objectForKey:@"latitude"]] floatValue];
    ((Shout *)[shoutsArray objectAtIndex:index]).longitude = [[NSString stringWithFormat:@"%@", [shout objectForKey:@"longitude"]] floatValue];
    ((Shout *)[shoutsArray objectAtIndex:index]).updatedAt = [NSString stringWithFormat:@"%@", [shout objectForKey:@"updated_at"]];
}


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
    
    region.span=span;
    region.center=location;
    //[mapView setCenterCoordinate:location];
    [mapView setRegion:region animated:TRUE];
    //[mapView regionThatFits:region];
    [self.view addSubview:mapView];
    
    /*for (int i = 0; i < 5; i++) {
        CGFloat latDelta = rand()*.035/RAND_MAX - .02;
        CGFloat longDelta = rand()*.03/RAND_MAX - .015;
        
        CLLocationCoordinate2D coords = {location.latitude+latDelta, location.longitude+longDelta};
        DropPin *pin = [[DropPin alloc] initWithCoordinate:coords];
        [mapView addAnnotation:pin];
    }*/
    
    //[self.view insertSubview:mapView atIndex:0];
    
    
    NSString * mylong = [NSString stringWithFormat:@"%f", location.longitude];
    NSString * mylat = [NSString stringWithFormat:@"%f", location.latitude];
    
    
    NSMutableDictionary *testDictionary = [[NSMutableDictionary alloc] init];
    [testDictionary setObject:@"12" forKey:@"id"];
    [testDictionary setObject:@"Hobo" forKey:@"title"];
    [testDictionary setObject:@"He's playing a shiny guitar!" forKey:@"description"];
    [testDictionary setObject:@"20" forKey:@"popularity"];
    [testDictionary setObject:@"37.7783" forKey:@"latitude"];
    [testDictionary setObject:@"-122.4182" forKey:@"longitude"];
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
        
        BOOL alreadyExists = NO;
        for (int i = 0; i < [shoutsArray count]; i++){
            if ([[shoutsArray objectAtIndex:i] shoutID] == [[NSString stringWithFormat:@"%@", id] intValue]){
                alreadyExists = YES;
                [self changeShout:i shoutDict:shout];
                break;
            }
        }
        if (alreadyExists)
            continue;
        
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
                                       popularity:[NSNumber numberWithFloat:[[NSString stringWithFormat:@"%@", popularity] floatValue]] 
                                         latitude:[NSNumber numberWithFloat:[[NSString stringWithFormat:@"%@", latitude] floatValue]] 
                                        longitude:[NSNumber numberWithFloat:[[NSString stringWithFormat:@"%@", longitude] floatValue]] 
                                        createdAt:[NSString stringWithFormat:@"%@", createdAt] 
                                        updatedAt:[NSString stringWithFormat:@"%@", updatedAt] ];
        
        CLLocationCoordinate2D coord = {shout.latitude, shout.longitude};
        DropPin *pin = [[DropPin alloc] initWithCoordinate:coord];
        [mapView addAnnotation:pin];
        [shoutsArray addObject:shout];
    }
    
    NSLog(@"%i", [(Shout *)[shoutsArray objectAtIndex:0] shoutID]);
    NSLog(@"%@", [(Shout *)[shoutsArray objectAtIndex:0] title]);
    NSLog(@"%@", [(Shout *)[shoutsArray objectAtIndex:0] description]);
    NSLog(@"%f", [(Shout *)[shoutsArray objectAtIndex:0] popularity]);
    NSLog(@"%f", [(Shout *)[shoutsArray objectAtIndex:0] latitude]);
    NSLog(@"%f", [(Shout *)[shoutsArray objectAtIndex:0] longitude]);
    NSLog(@"Num of Events: %i", [shoutsArray count]);
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
