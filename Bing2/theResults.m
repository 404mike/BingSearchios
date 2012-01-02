//
//  theResults.m
//  Bing
//
//  Created by David Michael Jones on 26/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "theResults.h"

@implementation theResults
@synthesize title, url, description;

-(id)initWithTitle:(NSString *)_title url:(NSString *) _url description:(NSString *) _description{
    if (self == [super init]) {
        [self setTitle:_title];
        [self setUrl:_url];
        [self setDescription:_description];
    }
    return self;
}

@end
