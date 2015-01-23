//
//  NSArray+Customizations.m
//  TravellingSalesman
//
//  Created by Spencer Morris on 1/23/15.
//  Copyright (c) 2015 SpencerMorris. All rights reserved.
//

#import "NSArray+Customizations.h"

@implementation NSArray (Customizations)

- (id)randomElement
{
    if (self.count > 0) {
        NSInteger randomIndex = arc4random_uniform((int) self.count);
        
        return [self objectAtIndex:randomIndex];
    } else {
        return nil;
    }
}

@end
