//
//  MainVC.m
//  TravellingSalesman
//
//  Created by Spencer Morris on 1/22/15.
//  Copyright (c) 2015 SpencerMorris. All rights reserved.
//

#import "MainVC.h"
#import "City.h"

@interface MainVC ()

@property (weak, nonatomic) IBOutlet UILabel *cityNamesLabel;

@property (strong, nonatomic) NSArray *cities;

@end

@implementation MainVC
NSString *SEGUE_MAP = @"map", *SEGUE_CITIES = @"cities", *SEGUE_RESULTS = @"results";

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setupUI];
}

- (void)setupUI
{
    // setup names of cities
    NSMutableString *cityNames = [[NSMutableString alloc] init];
    for (City *city in [UserDefaults cities]) {
        if (city.isSelected) {
            if (cityNames.length > 0) {
                [cityNames appendString:[NSString stringWithFormat:@", %@", city.name]];
            } else {
                [cityNames appendString:city.name];
            }
        }
    }
    self.cityNamesLabel.text = [cityNames copy];
}

- (NSArray *)cities
{
    if (! _cities) {
        NSMutableArray *mutableCities = [[NSMutableArray alloc] init];
        for (City *city in [UserDefaults cities]) {
            if (city.isSelected) {
                [mutableCities addObject:city];
            }
        }
        
        _cities = [mutableCities copy];
    }
    
    return _cities;
}

#pragma mark- Actions

- (IBAction)editCitiesButtonPressed
{
    [self performSegueWithIdentifier:SEGUE_CITIES sender:self];
}

- (IBAction)calculateButtonPressed
{
    NSLog(@"calculate");
    NSArray *citiesInOrder = [Utils citiesInMostEfficientOrderFromCities:self.cities];
    NSLog(@"calculation done");
}

@end
