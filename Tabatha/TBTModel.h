//
//  TBTModel.h
//  Tabatha
//
//  Created by Matte on 3/31/14.
//  Copyright (c) 2014 mxtte. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TBTXMLParserDelegate.h"
#import "TBTChannelItemParser.h"

@interface TBTModel : TBTXMLParserDelegate

@property (nonatomic, strong) NSMutableDictionary* channels;
// Temp channel content holders
@property (nonatomic, copy) NSMutableDictionary* channel;
@property (nonatomic, weak) NSArray* channelItemElements;
@property (nonatomic) NSInteger feedCap;
@property (nonatomic, strong) NSMutableArray* parsedContent;

- (TBTModel*) initWithFeeds:(NSArray*)feeds;

- (void) addChannel:(NSDictionary*)d;
- (void) addContent:(NSDictionary*)d;

- (void) parseFeed:(NSArray*)feed;
- (void) refreshFeed:(NSString*)feed;
- (void) fetchFeed:(NSString*)feed;


@end

