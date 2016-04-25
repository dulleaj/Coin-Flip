//
//  ViewController.m
//  Coin Flip
//
//  Created by Andrew Dulle on 4/7/16.
//  Copyright © 2016 Andrew Dulle. All rights reserved.
//

#import "ViewController.h"
#import "Coin.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *coinImage;
@property (weak, nonatomic) IBOutlet UIButton *flipButton;
@property Coin* quarter;
@property (weak, nonatomic) IBOutlet UILabel *flipResultsLabel;
@property (weak, nonatomic) IBOutlet UILabel *percentagesLabel;
@property NSTimer* coinFlipTime;
@property int currentImageCount;
@property NSArray* flipImages;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.quarter = [[Coin alloc] init];
    self.flipResultsLabel.hidden = YES;
    self.coinImage.hidden = YES;
    
    [self.quarter viewPercentages];
    self.percentagesLabel.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"Saved String"];
    self.percentagesLabel.hidden = NO;
    
    self.flipImages = @[[NSArray arrayWithObjects:@"Flip1",@"Flip2", nil]];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


// COIN IS FLIPPED
- (IBAction)flipButtonWasPressed:(id)sender {

    self.flipButton.hidden = YES;
    self.flipResultsLabel.hidden = YES;
    self.coinImage.hidden = YES;

    [self.quarter coinIsFlipped];
    
    self.currentImageCount = 0;
    
    self.coinFlipTime = [NSTimer scheduledTimerWithTimeInterval: .15
                        target:self
                        selector:@selector(changeCoinImage)
                        userInfo:nil
                        repeats:YES];
    
}

// SELECTOR FOR TIMER POINTS TO
- (void)changeCoinImage {

    self.coinImage.hidden = NO;
    
    self.currentImageCount += 1;
    
    if ((self.currentImageCount == 1) || (self.currentImageCount == 4) || (self.currentImageCount == 7) || (self.currentImageCount == 10)){
        
        self.coinImage.image = [UIImage imageNamed:@"Flip1"];
        
    }else if ((self.currentImageCount == 2) || (self.currentImageCount == 5) || (self.currentImageCount == 8) || (self.currentImageCount == 11)){
        
        self.coinImage.image = [UIImage imageNamed:@"Flip2"];
        
    }else if ((self.currentImageCount == 3) || (self.currentImageCount == 6) || (self.currentImageCount == 9)){
        
        self.coinImage.image = [UIImage imageNamed:@"Flip3"];
        
    }else if (self.currentImageCount == 12){
    
        [self.coinFlipTime invalidate];
        self.coinFlipTime = nil;
        
        self.coinImage.image = [UIImage imageNamed:self.quarter.imageString],
        self.coinImage.hidden = NO;
        
        self.flipResultsLabel.text = self.quarter.imageString;
        self.flipResultsLabel.hidden = NO;
        
        self.percentagesLabel.text = self.quarter.updatedPercentages;
        [[NSUserDefaults standardUserDefaults] setObject:self.quarter.updatedPercentages forKey:@"Saved String"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        self.flipButton.hidden = NO;
    }
}

// Get back to blank time. Recreate EPS files for coins that have indistingushable faces, have a simple flip added in that starts at a quarter trurn.

/*NSInteger currentIndex = [self.flipImages indexOfObject:self.coinImage.image];
 NSInteger nextIndex    = (currentIndex + 1) % self.flipImages.count;
 
 self.coinImage.image = self.flipImages[nextIndex];*/

@end
