//
//  tableCell.m
//  Bing
//
//  Created by David Michael Jones on 26/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "tableCell.h"

@implementation tableCell
@synthesize titleLabel, urlLabel, descriptionLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:titleLabel];
        urlLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:urlLabel];
        descriptionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:descriptionLabel];
    }
    return self;
}

-(void) layoutSubviews {
    
    titleLabel.frame = CGRectMake(5, 5, self.frame.size.width-5, 10);
    
    titleLabel.textColor = [UIColor blackColor];
    
    titleLabel.font = [UIFont fontWithName:@"Times New Roman" size:12];
    
    descriptionLabel.frame = CGRectMake(5, 15, self.frame.size.width-5, 15);
    
    descriptionLabel.textColor = [UIColor blackColor];
    
    descriptionLabel.font = [UIFont fontWithName:@"Times New Roman" size:12];
    
    urlLabel.frame = CGRectMake(5, 25, self.frame.size.width-5, 20);
    
    urlLabel.textColor = [UIColor blackColor];
    
    urlLabel.font = [UIFont fontWithName:@"Times New Roman" size:10];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
