//
//  TBTXMLParserDelegate.h
//  Tabatha
//
//  Created by Matte on 3/31/14.
//  Copyright (c) 2014 mxtte. All rights reserved.
//
//  Generic XML parsing class to be subclassed per desired element

#import <Foundation/Foundation.h>


@interface TBTXMLParserDelegate : NSObject <NSXMLParserDelegate>

@property (nonatomic, copy) NSString* name;
@property (nonatomic, strong) NSMutableString* content;
@property (nonatomic, weak) TBTXMLParserDelegate* parent;
@property (nonatomic, strong) TBTXMLParserDelegate* child;

- (void) start:(NSString*)elementName parent:(id)parent;
- (void) makeChild:(Class)class elementName:(NSString*)elementName parser:(NSXMLParser*)parser;
- (void) finishedChild:(NSString*)s;

@end
