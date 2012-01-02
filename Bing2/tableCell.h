//
//  tableCell.h
//  Bing
//
//  Created by David Michael Jones on 26/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tableCell : UITableViewCell{
    UILabel *titleLabel;
    UILabel *urlLabel;
    UILabel *descriptionLabel;
}

@property (nonatomic, retain) UILabel *titleLabel;
@property (nonatomic, retain) UILabel *urlLabel;
@property (nonatomic, retain) UILabel *descriptionLabel;

@end
