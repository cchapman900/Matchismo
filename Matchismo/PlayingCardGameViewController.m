//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Chris on 5/28/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "PlayingCardCollectionViewCell.h"

@interface PlayingCardGameViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *difficultyLevelTab;
@property (weak, nonatomic) IBOutlet UISegmentedControl *numCardsTab;

@end

@implementation PlayingCardGameViewController

-(void)viewDidLoad
{
    self.game.difficultyLevel = [self getDifficultyLevel];
    self.game.numCardsInPlay = [self getNumCardsInPlay];
}

-(Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
    
}

-(int)getDifficultyLevel
{
    return self.difficultyLevelTab.selectedSegmentIndex +2;
}

-(NSUInteger)getNumCardsInPlay
{
    NSUInteger multiplier = 1;
    for (int i = 1; i <= self.numCardsTab.selectedSegmentIndex; i++) {
        multiplier = multiplier + multiplier;
    }
    
    return 12 * multiplier;
}

- (IBAction)numCardsTab:(UISegmentedControl *)sender {
    self.game.numCardsInPlay = [self getNumCardsInPlay];
    [self.cardCollectionView reloadData];
}

-(void)dealButton
{
    self.difficultyLevelTab.enabled = YES;
    self.numCardsTab.enabled = YES;
    [super dealButton];
    self.game.difficultyLevel = [self getDifficultyLevel];
}

-(NSUInteger)startingCardCount {
    return [self getNumCardsInPlay]; //change this
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PlayingCard" forIndexPath:indexPath];
    Card *card = [self.game cardAtIndex:indexPath.item];
    [self updateCell:cell usingCard:card animate:NO];
    return cell;
}

-(void)updateCell:(UICollectionViewCell *)cell
        usingCard:(Card *)card
          animate:(BOOL)animate
{
    if (animate) {
    }
    if ([cell isKindOfClass:[PlayingCardCollectionViewCell class]]) {
        PlayingCardView *playingCardView = ((PlayingCardCollectionViewCell *)cell).playingCardView;
        if ([card isKindOfClass:[PlayingCard class]]) {
            PlayingCard *playingCard = (PlayingCard *)card;
            playingCardView.suit = playingCard.suit;
            playingCardView.rank = playingCard.rank;
            if (animate) {
                [UIView transitionWithView:playingCardView
                                  duration:0.5
                                   options:UIViewAnimationOptionTransitionFlipFromLeft
                                animations:^{
                                    playingCardView.faceUp = playingCard.isFaceUp;
                                }
                                completion:NULL];
            } else {
                playingCardView.faceUp = playingCard.isFaceUp;
            }
        playingCardView.alpha = playingCard.isUnplayable ? 0.3 : 1.0;
        }
    }
}

- (IBAction)flipCard:(UITapGestureRecognizer *)sender {
    [super flipCard:sender];
    self.difficultyLevelTab.enabled = NO;
    self.numCardsTab.enabled = NO;
}

- (IBAction)difficultyLevelTab:(UISegmentedControl *)sender {
    self.game.difficultyLevel = sender.selectedSegmentIndex + 2;
}


@end
