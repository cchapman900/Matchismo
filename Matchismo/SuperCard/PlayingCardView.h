//
//  PlayingCardView.h
//  SuperCard
//
//  Created by Chris on 5/28/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property(nonatomic)NSUInteger rank;
@property(strong, nonatomic)NSString *suit;

@property(nonatomic)BOOL faceUp;

@end
