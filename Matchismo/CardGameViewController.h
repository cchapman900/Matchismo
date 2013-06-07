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

@property (nonatomic)NSUInteger startingCardCount; //abstract
@property (strong, nonatomic)CardMatchingGame *game;

@property (weak, nonatomic) IBOutlet UICollectionView *cardCollectionView;//there should probably be a way to keep this private as well. I moved it here so I could subclass it in SetCardGameViewController on the flipCard method

-(Deck *)createDeck; //abstract
-(void)updateCell:(UICollectionViewCell *)cell usingCard:(Card *)card animate:(BOOL)animate; //abstract

- (IBAction)dealButton;
- (IBAction)flipCard:(UITapGestureRecognizer *)sender;

@end
