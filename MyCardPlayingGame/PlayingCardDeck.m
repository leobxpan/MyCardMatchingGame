//
//  PlayingCardDeck.m
//  MyCardPlayingGame
//
//  Created by caesar on 15/2/6.
//  Copyright (c) 2015年 Caesar. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"
@implementation PlayingCardDeck

-(instancetype)init{
    self = [super init];
    if(self){
        for(NSString *suit in [PlayingCard validSuits]){
            for(NSUInteger rank = 1;rank <= [PlayingCard maxRank];rank++){
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card atTop:NO];
            }
        }
    }
    return self;
}

@end
