//
//  Color.h
//  JSONParseExample
//
//  Created by osx on 22/03/17.
//  Copyright © 2017 com.domain.JSONParseExample. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Color : NSObject

@property (nonatomic,strong) NSString *colorName;
@property (nonatomic,strong) NSString *hexValue;

- (int)parseResponse:(NSDictionary *)receivedObjects;

@end
