//
//  Utils.m
//  TravellingSalesman
//
//  Created by Spencer Morris on 1/23/15.
//  Copyright (c) 2015 SpencerMorris. All rights reserved.
//

#import "Utils.h"
#import "City.h"

@implementation Utils

+ (NSArray *)citiesInMostEfficientOrderFromCities:(NSArray *)cities
{
    NSMutableArray *mutableCities = [[NSMutableArray alloc] init];
    
#warning TODO
    return cities;
}

+ (float)distanceBetweenCitiesInRelativeUnitsForCity:(City *)city1 andCity:(City *)city2
{
    return (city1.latitude.floatValue - city2.latitude.floatValue) * (city1.latitude.floatValue - city2.latitude.floatValue) + (city1.longitude.floatValue - city2.longitude.floatValue) * (city1.longitude.floatValue - city2.longitude.floatValue);
}

@end
