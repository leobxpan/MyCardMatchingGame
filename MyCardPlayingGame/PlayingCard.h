//
//  PlayingCard.h
//  MyCardPlayingGame
//
//  Created by caesar on 15/2/5.
//  Copyright (c) 2015年 Caesar. All rights reserved.
//

#import "Card.h"
@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+(NSArray *) validSuits;
+(NSArray *) rankStrings;
+(NSUInteger) maxRank;

@end
