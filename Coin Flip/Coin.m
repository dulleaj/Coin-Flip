//
//  Coin.m
//  Coin Flip
//
//  Created by Andrew Dulle on 4/7/16.
//  Copyright © 2016 Andrew Dulle. All rights reserved.
//

#import "Coin.h"

@implementation Coin

- (void)coinIsFlipped {
    
    self.totalFlips += 1;
    
    self.flipResults = arc4random_uniform(2);

    if (self.flipResults == 0){
        self.imageString = @"Heads";
        self.headsCount += 1;
    
    }else{
        self.imageString = @"Tails";
        self.tailsCount += 1;
    }
    
    float headsFloat = (100*self.headsCount)/self.totalFlips;
    self.headsPercentage = (int)roundf(headsFloat);
    
    float tailsFloat = (100*self.tailsCount)/self.totalFlips;
    self.tailsPercentage = (int)roundf(tailsFloat);
    
    [self setPercentages];
    [self viewPercentages];

}

// SET PERCENTAGES
- (void)setPercentages {
    
    self.defaults = [NSUserDefaults standardUserDefaults];
    [self.defaults setInteger:self.headsCount forKey:@"Heads Count"];
    [self.defaults setInteger:self.tailsCount forKey:@"Tails Count"];
    [self.defaults setInteger:self.totalFlips forKey:@"Total Flips"];
    [self.defaults synchronize];
}


// LOAD PERCENTAGES
- (void)viewPercentages {
    
    self.defaults = [NSUserDefaults standardUserDefaults];
    self.headsCount = (int)[self.defaults integerForKey:@"Heads Count"];
    self.tailsCount = (int)[self.defaults integerForKey:@"Tails Count"];
    self.totalFlips = (int)[self.defaults integerForKey:@"Total Flips"];
    self.updatedPercentages = [NSString stringWithFormat:@"Heads = %d%%  Tails = %d%%",self.headsPercentage,self.tailsPercentage];
    
}

@end
