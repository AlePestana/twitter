//
//  TweetCell.m
//  twitter
//
//  Created by marialepestana on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "Tweet.h"
#import "APIManager.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)didTapFavorite:(id)sender {
    
    // Update the local tweet model
    self.tweet.favorited = YES;
    self.tweet.favoriteCount += 1;
    self.favoriteButton.selected = YES;
    
    // Update cell UI
    
    // --------------------------------------------------------------------------------------->>> check: something missing, strong, self.tweet
    // Send a POST request to the POST favorites/create endpoint
    [[APIManager shared]favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            // NSLog(@"Error composing Tweet: %@", error.localizedDescription);
        }
        else {
            if ([sender isSelected]) {
                [sender setImage:self.profileImage forState:UIControlStateNormal];
                [sender setSelected:NO];
            } else {
                [sender setImage:self.profileImage forState:UIControlStateSelected];
                [sender setSelected:YES];
            }
        }
    }];
}


@end
