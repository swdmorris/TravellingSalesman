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

- (void)shuffle
{
    for (NSInteger i = (NSInteger)[self count] - 1; i > 0; i--)
    {
        NSUInteger j = (NSUInteger)arc4random_uniform((uint32_t)i + 1);
        [[self mutableCopy] exchangeObjectAtIndex:j withObjectAtIndex:(NSUInteger)i];
    }
}

- (NSArray *)shuffledArray
{
    NSMutableArray *copy = [NSMutableArray arrayWithArray:self];
    [copy shuffle];
    return copy;
}

@end
