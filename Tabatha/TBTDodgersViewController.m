//
//  TBTDodgersViewController.m
//  Tabatha
//
//  Created by Matte on 3/31/14.
//  Copyright (c) 2014 mxtte. All rights reserved.
//

#import "TBTDodgersViewController.h"

@implementation TBTDodgersViewController

@synthesize feedName;

- (void)viewDidLoad {
    self.feedName = @"dodgers";
    [super viewDidLoad];
    [self.inFormatter setDateFormat:@"EEE, dd MMMM yyyy HH:mm:ss zzz"];
}


@end
