//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Chris on 5/19/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardMatchingGame.h"

@interface CardGameViewController : UIViewController

@property (strong, nonatomic)CardMatchingGame *game;

@property (nonatomic)NSUInteger startingCardCount;//abstract

-(Deck *)createDeck; //abstract
-(void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card animate:(BOOL)animate; //abstract

- (IBAction)dealButton;
- (IBAction)flipCard:(UITapGestureRecognizer *)sender;

@end
