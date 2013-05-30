//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Chris on 5/19/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController () <UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *notificationLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *cardCollectionView;
@property (strong, nonatomic)NSMutableArray *animatedIndexes;

@end

@implementation CardGameViewController

-(NSMutableArray *)animatedIndexes {
    if (!_animatedIndexes) _animatedIndexes = [[NSMutableArray alloc] init];
    
    return _animatedIndexes;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    return self.startingCardCount; //will need to ask the game how many cards are currently in play
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil; //abstract
}

-(void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card animate:(BOOL)animate
{
    //abstract
}

-(CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.startingCardCount
                                                          usingDeck:[self createDeck]];
    return _game;
}

-(Deck *)createDeck {
    [NSException raise:@"Did not implement createDeck" format:@"Please implement createDeck() in %@", self.class];
    return nil;
} //abstract


- (IBAction)dealButton {
    self.game = nil;
    
    //Added to give deal button animation
    for (UICollectionViewCell *cell in [self.cardCollectionView visibleCells]) {
        NSIndexPath *indexPath = [self.cardCollectionView indexPathForCell:cell];
        [self.animatedIndexes addObject:indexPath];
    }
    
    
    [self updateUI];
    
    //end here.
    [self.animatedIndexes removeAllObjects];
}

-(void)updateUI
{
    for (UICollectionViewCell *cell in [self.cardCollectionView visibleCells]) {
        NSIndexPath *indexPath = [self.cardCollectionView indexPathForCell:cell];
        Card *card = [self.game cardAtIndex:indexPath.item];
        [self updateCell:cell usingCard:card animate:([self.animatedIndexes containsObject:indexPath])];
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
    self.notificationLabel.text = self.game.notification;
}

- (IBAction)flipCard:(UITapGestureRecognizer *)sender {
    CGPoint tapLocation = [sender locationInView:self.cardCollectionView];
    NSIndexPath *indexPath = [self.cardCollectionView indexPathForItemAtPoint:tapLocation];
    if (indexPath) {
        [self.game flipCardAtIndex:indexPath.item];
        [self.animatedIndexes addObject:indexPath];
        [self updateUI];
        [self.animatedIndexes removeObject:indexPath];
    }
}


@end
