//
//  ShoutFetcher.h
//  ShoutOut
//
//  Created by Kevin Ho on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoutFetcher : NSObject

+ (NSDictionary *)shoutQueryWithLongitude:(NSString *)longitude latitude:(NSString *)latitude;

@end
