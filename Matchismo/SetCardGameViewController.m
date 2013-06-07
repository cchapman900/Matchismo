//
//  SetCardGameViewController.m
//  Matchismo
//
//  Created by Chris on 5/28/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetCardDeck.h"
#import "SetCard.h"
#import "SetCardCollectionViewCell.h"

@implementation SetCardGameViewController

-(void)viewDidLoad
{
    self.game.difficultyLevel = 3;
}

-(Deck *)createDeck
{
    return [[SetCardDeck alloc] init];
}


-(NSUInteger)startingCardCount {
    return 12; //change this
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SetCard" forIndexPath:indexPath];
    Card *card = [self.game cardAtIndex:indexPath.item];
    [self updateCell:cell usingCard:card animate:NO];
    return cell;
}

-(void)updateCell:(UICollectionViewCell *)cell
        usingCard:(Card *)card
          animate:(BOOL)animate
{
    if ([cell isKindOfClass:[SetCardCollectionViewCell class]]) {
        SetCardView *setCardView = ((SetCardCollectionViewCell *)cell).setCardView;
        if ([card isKindOfClass:[SetCard class]]) {
            SetCard *setCard = (SetCard *)card;
            setCardView.number = setCard.number;
            setCardView.color = setCard.color;
            setCardView.shade = setCard.shade;
            setCardView.shape = setCard.shape;
            if (animate) {
                [UIView transitionWithView:setCardView
                                  duration:0.1
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    setCardView.selected = setCard.isFaceUp;
                                }
                                completion:NULL];
            } else {
                setCardView.selected = setCard.isFaceUp;
            }
            setCardView.alpha = setCard.isUnplayable ? 0.3 : 1.0;
        }
    }
}


- (IBAction)flipCard:(UITapGestureRecognizer *)sender
{
    //this looks really ugly
    
    [super flipCard:sender];
    
    
    NSMutableIndexSet *unplayableCardIndexes = [[NSMutableIndexSet alloc] init];
    NSMutableArray *unplayableCardIndexArray= [[NSMutableArray alloc]init];
    NSUInteger section = self.cardCollectionView.numberOfSections-1;
    
    for (Card *card in self.game.cards) {
        if (card.isUnplayable) {
            self.game.numCardsInPlay -= 1;
            NSUInteger cardIndex = [self.game.cards indexOfObject:card];
            [unplayableCardIndexes addIndex:cardIndex];
            NSIndexPath *cardIndexPath = [[NSIndexPath alloc]init];
            cardIndexPath = [NSIndexPath indexPathForItem:cardIndex inSection:section];
            [unplayableCardIndexArray addObject:cardIndexPath];
        }
    }
    
    
    
    
    [self.game.cards removeObjectsAtIndexes:unplayableCardIndexes];
    
    
    [self.cardCollectionView deleteItemsAtIndexPaths:unplayableCardIndexArray];
}


@end
