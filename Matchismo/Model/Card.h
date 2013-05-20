//
//  Card.h
//  Matchismo
//
//  Created by Chris on 5/20/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic)NSString *contents;

@property (nonatomic, getter = isFaceUp)BOOL faceUp;
@property (nonatomic, getter = isUnplayable)BOOL unplayable;

-(int)match:(NSArray *)otherCards;

@end
