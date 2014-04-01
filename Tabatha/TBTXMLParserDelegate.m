//
//  TBTXMLParserDelegate.m
//  Tabatha
//
//  Created by Matte on 3/31/14.
//  Copyright (c) 2014 mxtte. All rights reserved.
//

#import "TBTXMLParserDelegate.h"

@implementation TBTXMLParserDelegate

- (void) start:(NSString*)el parent:(id)p {
    self.name = el;
    self.parent = p;
    self.content = [NSMutableString string];
}

- (void) makeChild:(Class)class elementName:(NSString *)elementName parser:(NSXMLParser *)parser {
    TBTXMLParserDelegate* del = [class new];
    self.child = del;
    parser.delegate = del;
    [del start:elementName parent:self];
}

- (void) finishedChild:(NSString *)s {
    // For subclassin'
}

- (void) parser:(NSXMLParser*)parser foundCharacters:(NSString*)s {
    // Strip newlines and other interlopers
    NSString *clean_s = [s stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [self.content appendString:clean_s];
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if (self.parent) {
        [self.parent finishedChild:[self.content copy]];
        parser.delegate = self.parent;
    }
}

@end
