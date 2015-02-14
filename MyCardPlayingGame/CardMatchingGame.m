//
//  CardMatchingGame.m
//  MyCardPlayingGame
//
//  Created by caesar on 15/2/7.
//  Copyright (c) 2015年 Caesar. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray *cards;

@end
@implementation CardMatchingGame

static const int MATCH_BONUS = 4;
static const int MISMATCH_PENALTY = 2;
static const int FLIP_COST = 1;
-(NSMutableArray *)cards{
    if(!_cards){
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}
-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    if(self){
        for(int i = 0;i<count;i++){
            Card *card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }
    return self;
}
-(Card *)cardAtIndex:(NSUInteger)index{
    return (index<[self.cards count]) ? self.cards[index] : nil;
}
-(void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen = NO;
        }else{
            for(Card *otherCards in self.cards){
                if(otherCards.isChosen && !otherCards.isMatched){
                    int matchscore = [card match:@[otherCards]];
                    if(matchscore){
                        self.score += matchscore * MATCH_BONUS;
                        otherCards.matched = YES;
                        card.matched = YES;
                    }else{
                        self.score -= matchscore * MISMATCH_PENALTY;
                        otherCards.chosen = NO;//the geezer said it should be "otherCards.chosen = NO"
                    }
                    break;
                }
            }
            card.chosen = YES;
            self.score -= FLIP_COST;
        }
    }
}









@end
