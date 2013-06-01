//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Chris on 5/25/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property(nonatomic, readonly) int score;

@property(nonatomic)int difficultyLevel;

@property(strong, nonatomic)NSString *notification;

@property(nonatomic)int numCardsInPlay;

@property(strong, nonatomic) NSMutableArray *cards;

-(id)initWithCardCount:(NSUInteger)count
             usingDeck:(Deck *)deck;

-(void)flipCardAtIndex:(NSUInteger)index;

-(void)replaceInactiveCardsAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;


@end
