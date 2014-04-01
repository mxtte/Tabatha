//
//  TBTViceViewController.m
//  Tabatha
//
//  Created by Matte on 3/31/14.
//  Copyright (c) 2014 mxtte. All rights reserved.
//

#import "TBTViceViewController.h"

@implementation TBTViceViewController

@synthesize feedName;

- (void)viewDidLoad {
    self.feedName = @"vice";
    [super viewDidLoad];
    [self.inFormatter setDateFormat:@"EEE, dd MMMM yyyy HH:mm:ss Z"];
}

@end
