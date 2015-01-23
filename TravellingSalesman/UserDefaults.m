//
//  UserDefaults.m
//  TravellingSalesman
//
//  Created by Spencer Morris on 1/22/15.
//  Copyright (c) 2015 SpencerMorris. All rights reserved.
//

#import "UserDefaults.h"
#import "City.h"

@implementation UserDefaults
static NSArray *cities;

+ (NSArray *)cities
{
    if (! cities) {
        NSMutableArray *mutableCities = [[NSMutableArray alloc] init];
        NSString *citiesPath = [[NSBundle mainBundle] pathForResource:@"cities" ofType:@"plist"];
        NSArray *cityPListArray = [[NSArray alloc] initWithContentsOfFile:citiesPath];
        for (NSDictionary *cityDictionary in cityPListArray) {
            City *city = [[City alloc] initWithDictionary:cityDictionary];
            [mutableCities addObject:city];
        }
        
        cities = [mutableCities copy];
    }
    
    return cities;
}

@end
