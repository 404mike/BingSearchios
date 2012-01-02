//
//  web.h
//  Bing
//
//  Created by David Michael Jones on 26/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "theResults.h"

@interface web : UIViewController <UIWebViewDelegate>{
    IBOutlet UIWebView *webView;
    NSURL *theUrl;
}

@property (nonatomic, retain) theResults *results;

@end
