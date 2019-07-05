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
#import "UIImageView+AFNetworking.h"


@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)didTapFavorite:(UIButton *)sender {

    // Update the local tweet model
    
    // Update cell UI
    if (self.tweet.favorited) {
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        self.favoriteButton.selected = NO;
        // Refresh image
        // [sender setImage:self.favoriteButton forState:UIControlStateNormal];
        [self.favoriteButton setSelected:NO];
        
        [self refreshData];
        
        // Send a POST request to the POST favorites/create endpoint
        // For favoriting
        [[APIManager shared]unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error composing Tweet: %@", error.localizedDescription);
            }
            else {
                // NSLog(@"Successful");
                
            }
        }];
        
        
    } else {
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        self.favoriteButton.selected = YES;
        // Refresh image
        // [sender setImage:self.favoriteButton forState:UIControlStateSelected];
        [self.favoriteButton setSelected:YES];
        
        [self refreshData];
        
        // Send a POST request to the POST favorites/create endpoint
        // For favoriting
        [[APIManager shared]favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error composing Tweet: %@", error.localizedDescription);
            }
            else {
                // NSLog(@"Successful");
                
            }
        }];
        
    }
}

-(void)refreshData {
    self.retweetCount.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    self.favoriteCount.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    
    self.profileImage.image = nil;
    NSString *profileImageURL = self.tweet.user.profileImage;
    
    NSURL *url = [NSURL URLWithString:profileImageURL];
    [self.profileImage setImageWithURL:url];
}

- (IBAction)didTapRetweet:(UIButton *)sender {

    // Update the local tweet model
    NSString *rt;
    
    // Update cell UI
    if (self.tweet.retweeted) {
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        self.retweetButton.selected = NO;
        [self.retweetButton setSelected:NO];
        
        rt = @"unretweet";
        
    } else {
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        self.retweetButton.selected = YES;
        [self.retweetButton setSelected:YES];
        
        rt = @"retweet";

    }
    [self refreshData];
    
    // Send a POST request to the POST favorites/create endpoint
    // For both retweeting and unretweeting
    [[APIManager shared] retweet:self.tweet do:rt completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error composing Tweet: %@", error.localizedDescription);
        }
        else {
            NSLog(@"Successful");
            
        }
    }];

}


@end
