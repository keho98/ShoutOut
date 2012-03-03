//
//  ShoutFetcher.m
//  ShoutOut
//
//  Created by Kevin Ho on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShoutFetcher.h"
#import "JSON.h"

@implementation ShoutFetcher

+ (NSDictionary *)shoutQueryWithLongitude:(NSString *)longitude latitude:(NSString *)latitude
{
	NSString *urlString = [NSString stringWithFormat:@"http://api.flickr.com/services/rest/?%@&api_key=%@&format=json&nojsoncallback=1", longitude, latitude];
	NSLog(@"Sent to Flickr: %@", urlString);
	return [[NSString stringWithContentsOfURL:[NSURL URLWithString:urlString] encoding:NSUTF8StringEncoding error:nil] JSONValue];
}

@end
