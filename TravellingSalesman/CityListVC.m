//
//  CityListVC.m
//  TravellingSalesman
//
//  Created by Spencer Morris on 1/22/15.
//  Copyright (c) 2015 SpencerMorris. All rights reserved.
//

#import "CityListVC.h"

@interface CityListVC ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *cities;

@end

@implementation CityListVC

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
    
    return cell;
}

@end
