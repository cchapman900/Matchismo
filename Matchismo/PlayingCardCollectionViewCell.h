//
//  PlayingCardCollectionViewCell.h
//  Matchismo
//
//  Created by Chris on 5/28/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayingCardView.h"

@interface PlayingCardCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;

@end
