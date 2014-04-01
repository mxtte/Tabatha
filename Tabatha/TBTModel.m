//
//  TBTModel.m
//  Tabatha
//
//  Created by Matte on 3/31/14.
//  Copyright (c) 2014 mxtte. All rights reserved.
//

#import "TBTModel.h"

@implementation TBTModel

@synthesize channels;
// Temp channel content holders
@synthesize channel;
@synthesize channelItemElements;
@synthesize feedCap;
@synthesize parsedContent;
NSString* feedName;
NSXMLParser* _parser;
TBTChannelItemParser* _child;

// Feed management
- (TBTModel*) initWithFeeds:(NSArray*)feeds {
    self.channels = [NSMutableDictionary dictionary];
    // Iterate through the incoming feeds array
    for (id feed in feeds) {
        [self parseFeed:feed];
    }
    return self;
}
- (void) parseFeed:(NSArray *)feed {
    channel = [NSMutableDictionary dictionary];
    parsedContent = [NSMutableArray array];
    [channel setObject:parsedContent forKey:@"parsedContent"];
    
    feedName = feed[0];
    feedCap = [feed[1] intValue];
    channelItemElements = feed[3];
    [channel setObject:feedName forKey:@"feedName"];
    [channel setObject:feed[1] forKey:@"feedCap"];
    [channel setObject:channelItemElements forKey:@"channelItemElements"];
    
    NSXMLParser* parser = [[NSXMLParser alloc] initWithContentsOfURL:feed[2]];
    [channel setObject:feed[2] forKey:@"feedURL"];
    [parser setDelegate: self];
    [parser parse];
}

- (void) refreshFeed:(NSString *)feed {
    channel = [channels objectForKey:feed];
    NSArray* tempFeed = [NSArray arrayWithObjects:[channel objectForKey:@"feedName"],
                         [channel objectForKey:@"feedCap"], [channel objectForKey:@"feedURL"],
                         [channel objectForKey:@"channelItemElements"],nil];
    [self parseFeed:tempFeed];
}
- (void) fetchFeed:(NSString *)feed {
    [[NSNotificationCenter defaultCenter] postNotificationName:feed object:[[self.channels objectForKey:feed] objectForKey:@"parsedContent"]];
}
// Feed management

// Parsing
- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    _parser = parser;
}
- (void)parser:(NSXMLParser*)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"item"]) {
        [self makeChild:[TBTChannelItemParser class] elementName:elementName parser:parser];
        _child = (TBTChannelItemParser*)self.child;
    }
}
- (void)parser:(NSXMLParser*)parser parseErrorOccurred:(NSError*)parseError {
//    NSLog(@"%@", parseError);
/*    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Feed Error"
                                                    message:@"An internet connection is required to use this app."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [errorAlert show];
*/
}
- (void) addContent:(NSDictionary *)d {
    [parsedContent addObject:d];
    if (feedCap <= [parsedContent count]) {
        [_parser abortParsing];
        [self.channel setObject:parsedContent forKey:@"parsedContent"];
        [self addChannel:channel];
        [[NSNotificationCenter defaultCenter] postNotificationName:feedName object:parsedContent];
    }
}
- (void) addChannel:(NSDictionary*)d {
    [self.channels setObject:d forKey:feedName];
}
- (void) finishedChild:(NSString *)s {
    [self addContent:_child.channelItem];
}
// Parsing

@end
