//
//  Shout.h
//  ShoutOut
//
//  Created by Forrest Browning on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shout : NSObject {
    int shoutID;
    NSString *title;
    NSString *description;
    float popularity;
    float latitude;
    float longitude;
    NSString *createdAt;
    NSString *updatedAt;
}

-(id)initShoutID:(NSNumber *)shoutIDIn title:(NSString *)titleIn description:(NSString *)descriptionIn popularity:(NSNumber *)popularityIn latitude:(NSNumber *)latitudeIn longitude:(NSNumber *)longitudeIn createdAt:(NSString *)createdAtIn updatedAt:(NSString *)updatedAtIn;

@property(nonatomic) int shoutID;
@property(strong, nonatomic) NSString *title;
@property(strong, nonatomic) NSString *description;
@property(nonatomic) float popularity;
@property(nonatomic) float latitude;
@property(nonatomic) float longitude;
@property(strong, nonatomic) NSString *createdAt;
@property(strong, nonatomic) NSString *updatedAt;


@end
