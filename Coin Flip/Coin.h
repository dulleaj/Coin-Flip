//
//  Coin.h
//  Coin Flip
//
//  Created by Andrew Dulle on 4/7/16.
//  Copyright © 2016 Andrew Dulle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Coin : NSObject

@property int flipResults;

@property NSString* imageString;

@property int headsCount;

@property int tailsCount;

@property int totalFlips;

@property int tailsPercentage;

@property int headsPercentage;

@property NSUserDefaults* defaults;

@property NSString* updatedPercentages;

- (void)coinIsFlipped;

- (void)setPercentages;

- (void)viewPercentages;

@end
