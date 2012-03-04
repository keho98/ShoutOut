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
    SBJSON *parser = [[SBJSON alloc] init];
    NSString *url = [NSString stringWithFormat:@"http://shoutoutbackend.herokuapp.com/closestEvents/?latitude=%@&=longitude=%@&", latitude, longitude];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSLog(@"Sent Request With Coords: %@, %@", longitude, latitude);
    NSString *json_string = [[NSString alloc] initWithData:[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil] encoding:NSUTF8StringEncoding];
    return [parser objectWithString:json_string error:nil];
    
    
    
    /*SBJsonParser *adapter = [[SBJsonStreamParserAdapter alloc] init]; //GROSS STUFF-TODO for Conrad to demystify
    adapter.delegate = self;
    
    parser = [[SBJsonStreamParser alloc] init];
    parser.delegate = adapter;

    
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:url]
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:60.0];
    
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];*/
}


//???
/*
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"Connection didReceiveData of length: %u", data.length);
    NSString *str = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    NSLog(@"Data: %@", str );
    
    // Parse the new chunk of data. The parser will append it to
    // its internal buffer, then parse from where it left off in
    // the last chunk.
    SBJsonStreamParserStatus status = [parser parse:data];
    
    if (status == SBJsonStreamParserError)
    {
        NSLog(@"%@", [NSString stringWithFormat: @"The parser encountered an error: %@", parser.error] );
        NSLog(@"Parser error: %@", parser.error);
        
    } else if (status == SBJsonStreamParserWaitingForData)
    {
        NSLog(@"Parser waiting for more data");
    }
}*/

@end
