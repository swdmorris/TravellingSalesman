//
//  CityListVC.m
//  TravellingSalesman
//
//  Created by Spencer Morris on 1/22/15.
//  Copyright (c) 2015 SpencerMorris. All rights reserved.
//

#import "CityListVC.h"
#import "UserDefaults.h"
#import "City.h"

@interface CityListVC ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *cities;

@end

@implementation CityListVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.cities = [UserDefaults cities];
}

#pragma mark- UITableView datasource/delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityCell"];
    
    City *city = [self.cities objectAtIndex:indexPath.row];
    cell.textLabel.text = city.name;
    // show checkmark if city is selected
    cell.accessoryType = city.isSelected ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    return cell;
}

@end
