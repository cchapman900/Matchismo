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
#import "CardMatchingGame.h"

@interface CardGameViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic)CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UISegmentedControl *difficultyLevelTab;
@property (weak, nonatomic) IBOutlet UILabel *notificationLabel;

@end

@implementation CardGameViewController

-(void)viewDidLoad
{
    self.game.difficultyLevel = self.difficultyLevelTab.selectedSegmentIndex +2;
}
-(CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                          usingDeck:[[PlayingCardDeck alloc]init]];
    return _game;
}

-(void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
}

- (IBAction)difficultyLevelTab:(UISegmentedControl *)sender {
    self.game.difficultyLevel = sender.selectedSegmentIndex + 2;
}

- (IBAction)dealButton {
    self.game = nil;
    self.difficultyLevelTab.enabled = YES;
    [self updateUI];
}

-(void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
    self.notificationLabel.text = self.game.notification;
}

- (IBAction)flipCard:(UIButton *)sender {
    self.difficultyLevelTab.enabled = NO;
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    sender.selected = !sender.selected;
    [self updateUI];
}


@end
