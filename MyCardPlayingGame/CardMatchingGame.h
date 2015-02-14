//
//  CardMatchingGame.h
//  MyCardPlayingGame
//
//  Created by caesar on 15/2/7.
//  Copyright (c) 2015年 Caesar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
@interface CardMatchingGame : NSObject

-(instancetype)initWithCardCount : (NSUInteger)count
                       usingDeck : (Deck *)deck;
-(void)chooseCardAtIndex : (NSUInteger)index;
-(Card *)cardAtIndex : (NSUInteger)index;

@property (nonatomic,readonly) NSInteger score;

@end
