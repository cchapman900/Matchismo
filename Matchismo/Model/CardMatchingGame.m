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
@property(strong, nonatomic) NSMutableArray *cards;

@end

@implementation CardMatchingGame

- (int)difficultyLevel
{
    if (!_difficultyLevel) _difficultyLevel = 3;
    
    return _difficultyLevel;
}

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}


-(id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
    }
    
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 0

-(void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isUnplayable) {
        
        if (!card.isFaceUp){
            
            NSMutableArray *activeCards = [[NSMutableArray alloc] init];
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    [activeCards addObject:otherCard];
                }
                NSLog(@"Diffuculty level: %d",self.difficultyLevel);
                if (activeCards.count == self.difficultyLevel - 1) {
                    
                    int matchScore = [card match:activeCards];
                    if (matchScore) {
                        for (Card *activeCard in activeCards) {
                            activeCard.unplayable = YES;
                        }
                        card.unplayable = YES;
                        self.score += matchScore * MATCH_BONUS;
                    } else {
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
