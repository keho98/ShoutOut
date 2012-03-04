//
//  ShoutFetcher.m
//  ShoutOut
//
//  Created by Kevin Ho on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShoutFetcher.h"
#import "SBJSON.h"
#import "MapViewController.h"

@implementation ShoutFetcher

-(id)init:(NSObject*)mapIn longitude:(NSString *)longitude latitude:(NSString *)latitude {
    self = [super init];
    if (self != nil){
        map = mapIn;
        adapter = [[SBJsonStreamParserAdapter alloc] init];
        parser = [[SBJsonStreamParser alloc] init];
        
        adapter.delegate = self;
        parser.delegate = adapter;
        
        NSString *url = [NSString stringWithFormat:@"http://shoutoutbackend.herokuapp.com/closestEvents/?latitude=%@&longitude=%@", latitude, longitude];
        NSLog(@"%@\n", url);
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]
                                            cachePolicy:NSURLRequestUseProtocolCachePolicy
                                             timeoutInterval:60.0];
        
        connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    }
    return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //NSLog(@"%@", jsonString);
    
    SBJsonParser *parserTemp = [[SBJsonParser alloc] init];
    NSDictionary *dict = [parserTemp objectWithString:jsonString];
    
    NSArray *array = [dict objectForKey:@"closeEvents"];
    
    [(MapViewController*)map populateWithEvents:array];
}

- (void)parser:(SBJsonStreamParser*)parser foundArray:(NSArray*)array {
    //NSLog(@"FOUND ARRAY");
}

- (void)parser:(SBJsonStreamParser*)parser foundObject:(NSDictionary*)dict {
    //NSLog(@"FOUND OBJECT");
}

@end
