//
//  TBTTableViewCell.m
//  Tabatha
//
//  Created by Matte on 4/1/14.
//  Copyright (c) 2014 mxtte. All rights reserved.
//

#import "TBTTableViewCell.h"

@implementation TBTTableViewCell

@synthesize cellLink;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
