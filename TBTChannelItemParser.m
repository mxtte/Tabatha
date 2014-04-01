//
//  TBTChannelItemParser.m
//  Tabatha
//
//  Created by Matte on 3/31/14.
//  Copyright (c) 2014 mxtte. All rights reserved.
//

#import "TBTChannelItemParser.h"

@implementation TBTChannelItemParser

NSArray* channelItemElements;
@synthesize channelItem;
TBTModel* _parent;

- (void) start:(NSString*)elementName parent:(id)parent {
    _parent = (TBTModel*)parent;
    channelItemElements = _parent.channelItemElements;
    // get from model
    [super start:elementName parent:parent];
    self.channelItem = [NSMutableDictionary dictionary];
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    for (id itemElement in channelItemElements) {
        if ([elementName isEqualToString:itemElement]) {
            [self makeChild:[TBTXMLParserDelegate class] elementName:elementName parser:parser];
        }
    }
}

- (void) finishedChild:(NSString *)s {
    [self.channelItem setObject:s forKey:self.child.name];
    if ([self.channelItem count] >= [channelItemElements count]) {
        //  reset delegate to and pass channelItem to parent
    }
}

@end
