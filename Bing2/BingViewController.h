//
//  BingViewController.h
//  Bing
//
//  Created by David Michael Jones on 22/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BingViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate> {
    // NSString *jsonString;
    
    IBOutlet UITableView *theTableView;
    IBOutlet UITextField *theSearchField;
}

@property (nonatomic, retain) NSString *offValue;
@property (nonatomic, retain) NSMutableArray *stuff;

-(void) searchBing:(NSString *) text;
-(void) getData:(NSData *) response;

@end 