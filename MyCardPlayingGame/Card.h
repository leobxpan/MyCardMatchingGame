//
//  Card.h
//  MyCardPlayingGame
//
//  Created by caesar on 15/2/5.
//  Copyright (c) 2015年 Caesar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString *contents;
@property (nonatomic,getter = isChosen) BOOL chosen;
@property (nonatomic,getter = isMatched) BOOL matched;

-(int)match : (NSArray *)otherCards;

@end
