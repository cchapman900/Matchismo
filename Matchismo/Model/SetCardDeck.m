//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Chris on 5/28/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

-(id)init
{
    self = [super init];
    
    if (self) {
        for (int i = 1; i <= [SetCard maxNumber]; i++)
        {
            for (NSString *color in [SetCard validColors]) {
                for (NSString *shape in [SetCard validShapes]) {
                    for (NSString *shade in [SetCard validShades]) {
                        SetCard *card = [[SetCard alloc]init];
                        card.number = i;
                        card.color = color;
                        card.shape = shape;
                        card.shade = shade;
                        
                        [self addCard:card atTop:YES];
                    }
                }
            }
        }
    }
    
    return self;
}

@end
