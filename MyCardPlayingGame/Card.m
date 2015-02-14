//
//  Card.m
//  MyCardPlayingGame
//
//  Created by caesar on 15/2/5.
//  Copyright (c) 2015年 Caesar. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match : (NSArray *)otherCards{
    int score = 0;
    for(Card *card in otherCards){
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    return score;
}


@end
