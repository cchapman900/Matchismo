//
//  SetCard.m
//  Matchismo
//
//  Created by Chris on 5/28/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard


-(NSString *)contents
{
    NSString *pluralizedShape = self.shape;
    if (self.number > 1) {
        pluralizedShape = [pluralizedShape stringByAppendingString:@"s"];
    }
    return [NSString stringWithFormat:@"%d %@ %@ %@",self.number,self.shade,self.color,pluralizedShape];
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
