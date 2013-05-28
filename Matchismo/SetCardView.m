//
//  SetCardView.m
//  Matchismo
//
//  Created by Chris on 5/28/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import "SetCardView.h"

@implementation SetCardView

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.bounds.size.width * 0.2];
    
    [roundedRect addClip];
    
    if (self.selected) {
        [[UIColor grayColor] setFill];
    } else {
        [[UIColor whiteColor] setFill];
    }
    UIRectFill(self.bounds);
}

-(void)setNumber:(NSUInteger)number
{
    _number = number;
    [self setNeedsDisplay];
}

-(void)setColor:(NSString *)color
{
    _color = color;
    [self setNeedsDisplay];
}

-(void)setShape:(NSString *)shape
{
    _shade = shape;
    [self setNeedsDisplay];
}

-(void)setShade:(NSString *)shade
{
    _shade = shade;
    [self setNeedsDisplay];
}

-(void)setActive:(BOOL)selected
{
    _selected = selected;
    [self setNeedsDisplay];
}

-(void)setup {
    //initialization
}

-(void)awakeFromNib {
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}

@end
