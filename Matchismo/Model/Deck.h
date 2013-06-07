//
//  Deck.h
//  Matchismo
//
//  Created by Chris on 5/20/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;

-(Card *)drawRandomCard;

@end
