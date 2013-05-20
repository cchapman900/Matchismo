//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Chris on 5/19/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCard.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()

@property (strong, nonatomic)PlayingCardDeck *deck;

@end

@implementation CardGameViewController

- (PlayingCardDeck *)deck {
    if (!_deck) _deck = [[PlayingCardDeck alloc] init];
    
    return _deck;
}

- (IBAction)flipCard:(UIButton *)sender {
    if (!sender.selected) {
        Card *card = [self.deck drawRandomCard];
        [sender setTitle:card.contents forState:UIControlStateSelected];
    }
    sender.selected = !sender.selected;
}


@end
