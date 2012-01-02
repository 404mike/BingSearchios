//
//  theResults.h
//  Bing
//
//  Created by David Michael Jones on 26/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface theResults : NSObject{
    NSString *url, *title, *description; 
}

@property (nonatomic, retain) NSString *url, *title, *description;

-(id)initWithTitle:(NSString *)_title url:(NSString *) _url description:(NSString *) _description;

@end
