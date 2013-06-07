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

-(id)initWithCardCount:(NSUInteger)count
             usingDeck:(Deck *)deck;

-(void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

-(void)addThisManyCards:(NSUInteger)number;

@property(nonatomic, readonly) int score;

@property(nonatomic)int difficultyLevel;

@property(strong, nonatomic)NSString *notification;

@property(nonatomic)NSUInteger numCardsInPlay;

@property(strong, nonatomic)Deck *deck;

@property(strong, nonatomic) NSMutableArray *cards;//is there another way to subclass this without making it public?

@end
