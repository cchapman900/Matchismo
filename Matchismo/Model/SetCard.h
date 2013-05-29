//
//  SetCard.h
//  Matchismo
//
//  Created by Chris on 5/28/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property(nonatomic)NSUInteger number;
@property(strong, nonatomic)NSString *color;
@property(strong, nonatomic)NSString *shape;
@property(strong, nonatomic)NSString *shade;


+(NSUInteger)maxNumber;
+(NSArray *)validColors;
+(NSArray *)validShapes;
+(NSArray *)validShades;

@end
