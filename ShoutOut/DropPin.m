//
//  DropPin.m
//  ShoutOut
//
//  Created by Forrest Browning on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DropPin.h"

@implementation DropPin

@synthesize coordinate, image,shout_id;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coord {
    self = [super init];
    if (self != nil){
        coordinate = coord;
    }
    return self;
}

- (NSString *)title {
    return @"WHAT!?";
}

@end
