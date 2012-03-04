//
//  Shout.m
//  ShoutOut
//
//  Created by Forrest Browning on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Shout.h"

@implementation Shout

@synthesize shoutID, title, description, popularity, latitude, longitude, createdAt, updatedAt;

-(id)initShoutID:(NSNumber *)shoutIDIn title:(NSString *)titleIn description:(NSString *)descriptionIn popularity:(NSNumber *)popularityIn latitude:(NSNumber *)latitudeIn longitude:(NSNumber *)longitudeIn createdAt:(NSString *)createdAtIn updatedAt:(NSString *)updatedAtIn {
    self = [super init];
    if (self) {
        shoutID = shoutIDIn;
        title = titleIn;
        description = descriptionIn;
        popularity = popularityIn;
        latitude = [latitudeIn floatValue];
        longitude = [longitudeIn floatValue];
        createdAt = createdAtIn;
        updatedAt = updatedAtIn;
    }
    return self;
}

@end
