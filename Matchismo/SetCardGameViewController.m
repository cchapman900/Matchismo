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

-(Deck *)createDeck
{
    return [[SetCardDeck alloc] init];
}

-(NSUInteger)startingCardCount {
    return 48; //change this
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SetCard" forIndexPath:indexPath];
    Card *card = [self.game cardAtIndex:indexPath.item];
    [self updateCell:cell usingCard:card animate:NO];
    return cell;
}

-(void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card animate:(BOOL)animate
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
                                  duration:0.2
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    setCardView.selected = setCard.selected;
                                }
                                completion:NULL];
            } else {
                setCardView.selected = setCard.selected;
            }
            setCardView.alpha = setCard.isUnplayable ? 0.3 : 1.0;
        }
    }
}


@end
