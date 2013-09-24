//
//  ViewController.m
//  DrawCard
//
//  Created by tcz on 8/26/13.
//  Copyright (c) 2013 Maer Studios Inc. All rights reserved.
//

#import "ViewController.h"
#import "CardView.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet CardView *cardDisplay;
@property (strong, nonatomic) Deck *deck;
@end

@implementation ViewController

-(Deck *)deck{
    if(!_deck) _deck = [[PlayingCardDeck alloc]init];
    return _deck;
}

-(void)setCardDisplay:(CardView *)cardDisplay{
    _cardDisplay = cardDisplay;
    UIGestureRecognizer *recongizer = [[UIPinchGestureRecognizer alloc]initWithTarget:cardDisplay action:@selector(pinch:)];
    [cardDisplay addGestureRecognizer:recongizer];
}
- (IBAction)flip:(UISwipeGestureRecognizer *)sender {
    //get a random card from a deck
    Card *card = self.deck.drawRandomCard;
    if([card isMemberOfClass:[PlayingCard class]]){
        PlayingCard *pCard = (PlayingCard *)card;
        self.cardDisplay.rank = pCard.rank;
        self.cardDisplay.suit = pCard.suit;
    }
    self.cardDisplay.faceUp = !self.cardDisplay.faceUp;
}
@end
