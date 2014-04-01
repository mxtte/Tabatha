//
//  TBTChannelItemParser.h
//  Tabatha
//
//  Created by Matte on 3/31/14.
//  Copyright (c) 2014 mxtte. All rights reserved.
//

#import "TBTXMLParserDelegate.h"
#import "TBTModel.h"

@interface TBTChannelItemParser : TBTXMLParserDelegate

@property NSMutableDictionary* channelItem;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, strong) NSMutableString* content;
@property (nonatomic, weak) TBTXMLParserDelegate* parent;


@end
