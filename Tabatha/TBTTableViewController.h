//
//  TBTViceViewController.h
//  Tabatha
//
//  Created by Matte on 3/31/14.
//  Copyright (c) 2014 mxtte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBTTabController.h"
#import "TBTTableViewCell.h"

@interface TBTTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSObject* dataSource;
@property (nonatomic, strong) NSObject* delegate;
@property (nonatomic, weak) NSString* feedName;
@property (nonatomic, weak) NSArray* channel;
@property (nonatomic, weak) TBTModel* model;
@property (nonatomic, strong) NSDateFormatter* inFormatter;

@end
