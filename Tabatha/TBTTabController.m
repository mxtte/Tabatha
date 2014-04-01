//
//  TBTTabController.m
//  Tabatha
//
//  Created by Matte on 3/31/14.
//  Copyright (c) 2014 mxtte. All rights reserved.
//

#import "TBTTabController.h"

@interface TBTTabController ()

@end

@implementation TBTTabController
@synthesize model;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configModel];
}

-(void)configModel
{
// Init feed settings
    NSArray* channelItemElements = [NSArray arrayWithObjects:@"title",@"link",@"pubDate",nil];
    NSNumber* feedCap = [NSNumber numberWithInt:5];
    NSArray* viceFeed = [NSArray arrayWithObjects:@"vice", feedCap, [NSURL URLWithString:@"http://vice.com/rss"], channelItemElements, nil];
    NSArray* dodgersFeed = [NSArray arrayWithObjects:@"dodgers", feedCap, [NSURL URLWithString:@"http://mlb.mlb.com/partnerxml/gen/news/rss/la.xml"], channelItemElements, nil];
    // convert to dictionary
    NSArray* feeds = [NSArray arrayWithObjects:viceFeed, dodgersFeed, nil];
    self.model = [[TBTModel alloc] initWithFeeds:feeds];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
