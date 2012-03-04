//
//  ShoutFetcher.h
//  ShoutOut
//
//  Created by Kevin Ho on 3/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBJsonStreamParserAdapter.h"

@interface ShoutFetcher : NSObject <SBJsonStreamParserAdapterDelegate> {
    SBJsonStreamParserAdapter *adapter;
    SBJsonStreamParser *parser;
    NSURLConnection *connection;
    NSObject *map;
}

-(id)init:(NSObject*)mapIn longitude:(NSString *)longitude latitude:(NSString *)latitude;

@end
