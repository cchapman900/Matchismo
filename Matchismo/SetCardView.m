//
//  SetCardView.m
//  Matchismo
//
//  Created by Chris on 5/28/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import "SetCardView.h"

@implementation SetCardView

#define SET_IMAGE_SIZE_PROPORTION 0.20

- (void)drawRect:(CGRect)rect
{
    if (self.selected) {
        [[UIColor grayColor] setFill];
    } else {
        [[UIColor whiteColor] setFill];
    }
    UIRectFill(self.bounds);
    
    CGFloat setImageSize = self.bounds.size.width * SET_IMAGE_SIZE_PROPORTION;
    
    UIImage *setImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@-%@-%@.png",self.shade,self.color,self.shape]];
    
    CGRect centerImageRect = CGRectMake(self.bounds.size.width/2-setImageSize/2, self.bounds.size.height/2-setImageSize/2, setImageSize, setImageSize);
    
    if (self.number == 1) {
        [setImage drawInRect:centerImageRect];
    } else if (self.number == 2) {
        CGFloat offset = setImageSize/1.9;
        CGRect left = CGRectOffset(centerImageRect, -offset, 0);
        CGRect right = CGRectOffset(centerImageRect, offset, 0);
        [setImage drawInRect:left];
        [setImage drawInRect:right];
    } else if (self.number == 3) {
        [setImage drawInRect:centerImageRect];
        CGFloat offset = setImageSize;
        CGRect left = CGRectOffset(centerImageRect, -offset, 0);
        CGRect right = CGRectOffset(centerImageRect, offset, 0);
        [setImage drawInRect:left];
        [setImage drawInRect:right];
    }
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
    _shape = shape;
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
