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

+ (NSArray *)shoutQueryWithLongitude:(NSString *)longitude latitude:(NSString *)latitude
{
	//NSString *urlString = [NSString stringWithFormat:@"http://api.flickr.com/services/rest/?lat=%@&=long=%@&", longitude, latitude];
	//return [[NSString stringWithContentsOfURL:[NSURL URLWithString:urlString] encoding:NSUTF8StringEncoding error:nil] JSONValue];
    
    
    
    SBJSON *parser = [[SBJSON alloc] init];
    
    // Prepare URL request to download statuses from Twitter
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://api.flickr.com/services/rest/?lat=%@&=long=%@&", longitude, latitude]]];
    
    NSLog(@"Sent Request With Coords: %@, %@", longitude, latitude);

    // Perform request and get JSON back as a NSData object
    // Get JSON as a NSString from NSData response
    NSString *json_string = [[NSString alloc] initWithData:[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil] encoding:NSUTF8StringEncoding];
    
    // parse the JSON response into an object
    // Here we're using NSArray since we're parsing an array of JSON status objects
    
    return [parser objectWithString:json_string error:nil];
}

@end
