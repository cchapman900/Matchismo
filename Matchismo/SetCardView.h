//
//  SetCardView.h
//  Matchismo
//
//  Created by Chris on 5/28/13.
//  Copyright (c) 2013 Chris Chapman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetCardView : UIView

@property(nonatomic)NSUInteger number;
@property(strong, nonatomic)NSString *color;
@property(strong, nonatomic)NSString *shape;
@property(strong, nonatomic)NSString *shade;

@property(nonatomic)BOOL selected;

@end
