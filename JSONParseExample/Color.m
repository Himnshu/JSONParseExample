//
//  Color.m
//  JSONParseExample
//
//  Created by osx on 22/03/17.
//  Copyright © 2017 com.domain.JSONParseExample. All rights reserved.
//

#import "Color.h"

@implementation Color

@synthesize colorName;
@synthesize hexValue;

- (int)parseResponse:(NSDictionary *)receivedObjects
{
    colorName = [receivedObjects objectForKey:@"colorName"];
    hexValue = [receivedObjects objectForKey:@"hexValue"];
    return 0;
}

@end
