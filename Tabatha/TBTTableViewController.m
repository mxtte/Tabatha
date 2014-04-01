//
//  TBTTableViewController.m
//  Tabatha
//
//  Created by Matte on 3/31/14.
//  Copyright (c) 2014 mxtte. All rights reserved.
//

#import "TBTTableViewController.h"

@implementation TBTTableViewController

@synthesize dataSource;
@synthesize delegate;
@synthesize feedName;
@synthesize channel;
@synthesize model;
@synthesize inFormatter;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.channel = [NSArray array];
    dataSource = self;
    delegate = self;
    NSDateFormatter *_inFormatter = [[NSDateFormatter alloc] init];
    NSLocale *enLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en"];
    [_inFormatter setLocale:enLocale];
    self.inFormatter = _inFormatter;
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refreshFeed:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateFeed:) name:self.feedName object:nil];
    TBTTabController* parentVC = (TBTTabController*)self.parentViewController;
    self.model = parentVC.model;
    [self.model fetchFeed:self.feedName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateFeed:(NSNotification*)notification {
    [self.refreshControl endRefreshing];
    self.channel = [notification object];
//    [self.tableView reloadData];
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.channel count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    NSDictionary* currentChannelItem = self.channel[row];
    
	static NSString *CellIdentifier = @"clickableCell";
	TBTTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
	if (cell == nil) {
		cell = [[TBTTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	}

    NSString *dateString = [currentChannelItem objectForKey:@"pubDate"];
    NSDate *pubDate = [self.inFormatter  dateFromString:dateString];
    NSDateFormatter *outFormatter = [[NSDateFormatter alloc] init];
    NSLocale *enLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en"];
    [outFormatter setLocale:enLocale];
    [outFormatter setDateFormat:@"EEEE, dd MMMM"];
    [cell.textLabel setText:[currentChannelItem objectForKey:@"title"]];
    [cell.detailTextLabel setText:[outFormatter  stringFromDate:pubDate]];
    cell.cellLink = [NSURL URLWithString:[currentChannelItem objectForKey:@"link"]];
	
    return cell;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TBTTableViewCell* tempCell = (TBTTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    [[UIApplication sharedApplication] openURL:tempCell.cellLink];
}

- (IBAction)refreshFeed:(id)sender {
    [self.model refreshFeed:self.feedName];
}

@end
