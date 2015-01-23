//
//  Utils.m
//  TravellingSalesman
//
//  Created by Spencer Morris on 1/23/15.
//  Copyright (c) 2015 SpencerMorris. All rights reserved.
//

#import "Utils.h"
#import "City.h"
#import "NSArray+Customizations.h"

@implementation Utils

#define kNumberOfTrials 100000
+ (NSArray *)citiesInMostEfficientOrderFromCities:(NSArray *)cities
{
    float minDistance = MAXFLOAT;
    NSArray *shortestCityRoute = nil;
    
    for (NSArray *cityList in [self cities:cities InRandomOrderWithNumberOfLists:kNumberOfTrials]) {
        float currentDistance = 0.0;
        for (int i = 1; i < cityList.count; i++) {
            // start from index 1 and add distance between city 'i - 1' and 'i'
            currentDistance += [self distanceBetweenCitiesInRelativeUnitsForCity:[cityList objectAtIndex:(i - 1)] andCity:[cityList objectAtIndex:i]];
        }
        
        if (currentDistance < minDistance) {
            minDistance = currentDistance;
            shortestCityRoute = cityList;
        }
    }
    
    NSLog(@"Shortest Distance: %f", minDistance);
    
    return shortestCityRoute;
}

+ (float)distanceBetweenCitiesInRelativeUnitsForCity:(City *)city1 andCity:(City *)city2
{
    return (city1.latitude.floatValue - city2.latitude.floatValue) * (city1.latitude.floatValue - city2.latitude.floatValue) + (city1.longitude.floatValue - city2.longitude.floatValue) * (city1.longitude.floatValue - city2.longitude.floatValue);
}

+ (NSMutableArray *)allPossibleCombinationsOfRemainingArray:(NSMutableArray *)remainingCities addingToArray:(NSMutableArray *)listsOfCities
{
#warning Not working yet
    if (listsOfCities.count == 0) {
        for (City *city in remainingCities) {
            [listsOfCities addObject:[NSMutableArray arrayWithObject:city]];
        }
    }
    
    for (City *city in remainingCities) {
        // add city to all lists
        for (NSMutableArray *listOfCities in listsOfCities) {
            [listOfCities addObject:city];
        }
        
        // create array without current city left
        NSMutableArray *newRemainingCities = [remainingCities mutableCopy];
        [newRemainingCities removeObject:city];
        
        return [self allPossibleCombinationsOfRemainingArray:newRemainingCities addingToArray:listsOfCities];
    }
    
    // once there are no more remainingCities, this returns final array
    return listsOfCities;
}

+ (NSArray *)cities:(NSArray *)cities InRandomOrderWithNumberOfLists:(NSInteger)numberOfLists
{
    NSMutableArray *cityLists = [NSMutableArray new];
    
    for (int i = 0; i < numberOfLists; i++) {
        [cityLists addObject:[cities shuffledArray]];
    }
    
    return [cityLists copy];
}

@end
