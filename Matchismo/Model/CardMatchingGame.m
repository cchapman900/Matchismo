//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Chris on 5/25/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property(nonatomic, readwrite) int score;
@property(strong, nonatomic) Deck *deck;
@property(strong, nonatomic) NSMutableArray *cards;

@end

@implementation CardMatchingGame

-(int)difficultyLevel
{
    if (!_difficultyLevel) _difficultyLevel = 3;
    return _difficultyLevel;
}

-(NSString *)notification {
    if (!_notification) _notification = [[NSString alloc] init];
    
    return _notification;
}

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    _deck = deck;
    _numCardsInPlay = count;
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [self.deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
    }
    
    return self;
}

-(Card *)getLastCard
{
    return [self.cards lastObject];
}

-(void)addThisManyCards:(NSUInteger)number
{
    for (int i = 1; i<=number; i++) {
        [self.cards addObject:[self.deck drawRandomCard]]; //add in some error checking for when out of cards
        self.numCardsInPlay = self.cards.count;
    }
}


-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

+(NSString *)formatActiveCards:(NSMutableArray*)activeCards
{
    NSMutableArray *cardContents = [[NSMutableArray alloc] init];
    for (Card *card in activeCards) {
        [cardContents addObject:card.contents];
    }
    NSString *formattedCards = [cardContents componentsJoinedByString:@", "];
    
    return formattedCards;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 0


-(void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    self.notification = [NSString stringWithFormat:@" "];
    
    if (!card.isUnplayable) {
        
        if (!card.isFaceUp){
            
            NSMutableArray *activeCards = [[NSMutableArray alloc] init];
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    [activeCards addObject:otherCard];
                }
                if (activeCards.count == self.difficultyLevel - 1) {
                    
                    int matchScore = [card match:activeCards];
                    if (matchScore) {
                        self.notification = [NSString stringWithFormat:@"Matched %@ and %@ for %d points!",[CardMatchingGame formatActiveCards:activeCards], card.contents, matchScore * MATCH_BONUS];
                        for (Card *activeCard in activeCards) {
                            activeCard.unplayable = YES;
                        }
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                    } else {
                        self.notification = [NSString stringWithFormat:@"%@ and %@ don't match! %d point penalty.", [CardMatchingGame formatActiveCards:activeCards], card.contents, MISMATCH_PENALTY];
                        for (Card *activeCard in activeCards) {
                            activeCard.faceUp = NO;
                        }
                        self.score -= MISMATCH_PENALTY;
                    }
                    break;
                }
                
            }
            
            self.score -= FLIP_COST;
        }
        
        card.faceUp = !card.isFaceUp;
    }
}

@end
