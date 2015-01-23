//
//  City.m
//  TravellingSalesman
//
//  Created by Spencer Morris on 1/22/15.
//  Copyright (c) 2015 SpencerMorris. All rights reserved.
//

#import "City.h"

@interface City ()

@property (strong, nonatomic) NSDictionary *data;

@end

@implementation City

- (id)initWithDictionary:(NSDictionary *)data
{
    self = [super init];
    
    if (self) {
        if ([data isKindOfClass:[NSDictionary class]]) {
            self.data = data;
        }
    }
    
    return self;
}

- (NSString *)description
{
    NSString *superDescription = [super description];
    
    return [NSString stringWithFormat:@"%@ - %@", superDescription, self.name];
}

- (NSString *)name
{
    return [self.data objectForKey:@"name"];
}

- (NSNumber *)latitude
{
    return [self.data objectForKey:@"latitude"];
}

- (NSNumber *)longitude
{
    return [self.data objectForKey:@"longitude"];
}

@end
