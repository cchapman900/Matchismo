//
//  SetCardMatchingGame.m
//  Matchismo
//
//  Created by Chris on 6/6/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import "SetCardMatchingGame.h"

@implementation SetCardMatchingGame



-(void)flipCardAtIndex:(NSUInteger)index
{
    [super flipCardAtIndex:index];
    
    for (Card *card in self.cards) {
        if (card.isUnplayable) {
            [self.cards removeObject:card];
        }
    }
}

@end
