//
//  Deck.h
//  MyCardPlayingGame
//
//  Created by caesar on 15/2/5.
//  Copyright (c) 2015年 Caesar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Deck : NSObject

-(void)addCard : (Card *)card atTop : (BOOL)atTop;
-(Card *)drawRandomCard;

@end
