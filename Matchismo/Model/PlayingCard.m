//
//  PlayingCard.m
//  Matchismo
//
//  Created by Chris on 5/20/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(NSString *)contents
{
    return [NSString stringWithFormat:@"%@%@",[[PlayingCard rankStrings] objectAtIndex: self.rank], self.suit];
}

//SUIT THINGS

@synthesize suit = _suit;

-(NSString *)suit
{
    return _suit ? _suit : @"?";
}

+(NSArray *)validSuits;
{
    return @[@"♠",@"♣",@"♥",@"♦"];
}

-(void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

//RANK THINGS

-(void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}

+(NSArray *)rankStrings
{
    return @[@"?",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K",@"A"];
}

+(NSUInteger)maxRank
{
    return [self rankStrings].count - 1;
}

@end
