//
//  City.h
//  TravellingSalesman
//
//  Created by Spencer Morris on 1/22/15.
//  Copyright (c) 2015 SpencerMorris. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

- (id)initWithDictionary:(NSDictionary *)data;

- (NSString *)name;
- (NSNumber *)latitude;
- (NSNumber *)longitude;

@end
