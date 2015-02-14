//
//  ViewController.m
//  MyCardPlayingGame
//
//  Created by caesar on 15/2/5.
//  Copyright (c) 2015年 Caesar. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "CardMatchingGame.h"
@interface ViewController ()

@property (strong,nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation ViewController

-(CardMatchingGame *)game{
    if(!_game){
        _game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count]
                                                 usingDeck:[self createDeck]];
    }
    return _game;
}
-(Deck *)createDeck{
    return [[PlayingCardDeck alloc]init];
}
- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}
-(void)updateUI{
    for(UIButton *cardButton in self.cardButtons){
        NSUInteger  cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score:%ld",(long)self.game.score];
    }
}
-(UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}
-(NSString *)titleForCard:(Card *)card{
    return card.isChosen ? card.contents : @"";
}

@end
