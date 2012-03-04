//
//  DropPin.h
//  ShoutOut
//
//  Created by Forrest Browning on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface DropPin : MKAnnotationView <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
    
    UIImage *image;
}

@property(nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property(strong, nonatomic) UIImage *image;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coord;

- (NSString *)title;

@end
