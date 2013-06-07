//
//  SetCard.m
//  Matchismo
//
//  Created by Chris on 5/28/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard


-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    if (otherCards.count == 2) {
        SetCard *firstCard = otherCards[0];
        SetCard *secondCard = otherCards[1];
        
        int numberMatch = [SetCard compareSetCardValue1:[NSString stringWithFormat: @"%d",self.number]
                                               toValue2:[NSString stringWithFormat: @"%d",firstCard.number]
                                              andValue3:[NSString stringWithFormat: @"%d",secondCard.number]];
        
        int colorMatch = [SetCard compareSetCardValue1:self.color
                                              toValue2:firstCard.color
                                             andValue3:secondCard.color];
        
        int shapeMatch = [SetCard compareSetCardValue1:self.shape
                                              toValue2:firstCard.shape
                                             andValue3:secondCard.shape];
        
        int shadeMatch = [SetCard compareSetCardValue1:self.shade
                                              toValue2:firstCard.shade
                                             andValue3:secondCard.shade];
        
        if (numberMatch && colorMatch && shapeMatch && shadeMatch) {
            score = numberMatch + colorMatch + shapeMatch + shadeMatch;
        }
        
    } else {
        [NSException raise:@"Not comparing the correct ammount of cards in SetCard" format:NULL];
    }
    
    return score;
}

+(int)compareSetCardValue1:(NSString *)value1 toValue2:(NSString *)value2 andValue3:(NSString *)value3
{
    if ([value1 isEqualToString:value2]) {
        if ([value1 isEqualToString:value3]) {
            return 1;
        }
    } else if (![value1 isEqualToString:value3] && ![value2 isEqualToString:value3]){
        return 2;
    }
    
    return 0;
}

-(NSString *)contents
{
    NSString *shape = [[NSString alloc] init];
    for (int i = 1; i <= self.number; i++) {
        shape = [shape stringByAppendingString:[SetCard stringToShape][self.shape]];
    }
    return [NSString stringWithFormat:@"%@ %@ %@",self.shade,self.color,shape];
}

+(NSDictionary *)stringToShape
{
    return @{@"Squiggle" : @"≈", @"Oval" : @"●", @"Diamond" : @"◆"};
}

+(NSUInteger)maxNumber
{
    return 3;
}

+(NSArray *)validColors
{
    return @[@"Red", @"Green", @"Purple"];
}
+(NSArray *)validShapes
{
    return @[@"Diamond",@"Squiggle",@"Oval"];
}
+(NSArray *)validShades
{
    return @[@"Solid",@"Striped",@"Open"];
}

@end
