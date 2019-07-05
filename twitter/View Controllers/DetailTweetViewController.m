//
//  DetailTweetViewController.m
//  twitter
//
//  Created by marialepestana on 7/4/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "DetailTweetViewController.h"
#import "UIImageView+AFNetworking.h"
#import "Tweet.h"
#import "User.h"
#import "APIManager.h"


@interface DetailTweetViewController ()

@property (weak, nonatomic) IBOutlet UILabel *authorName;
@property (weak, nonatomic) IBOutlet UILabel *authorAccount;
@property (weak, nonatomic) IBOutlet UILabel *tweetText;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *retweetCount;
@property (weak, nonatomic) IBOutlet UILabel *favoriteCount;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;

@end

@implementation DetailTweetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // _tweet = tweet;
    
    User *user = self.tweet.user;
    

    // Assign values to my properties
    self.authorName.text = user.name;
    
    NSString *accountBase = @"@";
    self.authorAccount.text = [accountBase stringByAppendingString:self.tweet.user.screenName];

    self.tweetText.text = self.tweet.text;
    self.retweetCount.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    self.favoriteCount.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];

    self.date.text = self.tweet.createdAtString;

    NSString *profileImageURL = self.tweet.user.profileImage;

    self.profileImage.image = nil;
    NSURL *url = [NSURL URLWithString:profileImageURL];
    [self.profileImage setImageWithURL:url placeholderImage:[UIImage imageNamed:@"user_icon.png"]];
    
     // Some images were not downloaded
    
}


// Function that refreshes the data
-(void)refreshData {
    self.retweetCount.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    self.favoriteCount.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
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

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

