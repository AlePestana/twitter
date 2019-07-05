//
//  DetailTweetViewController.m
//  twitter
//
//  Created by marialepestana on 7/4/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "DetailTweetViewController.h"
#import "UIImageView+AFNetworking.h"


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

}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

// Do any additional setup after loading the view.

// Poster image view
// Process to make complete URL post and display image



//NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
//NSString *posterURLString = self.movie[@"poster_path"];
//NSString *completePosterURLString = [baseURLString stringByAppendingString:posterURLString];
//
//NSURL *posterURL = [NSURL URLWithString:completePosterURLString];
//
//// Set image using function from AFNerwork using URL
//[self.posterView setImageWithURL:posterURL];
//
//// Bakckdrop image view
//// Process to make complete URL post and display image
//NSString *backdropURLString = self.movie[@"backdrop_path"];
//NSString *completeBackdropURLString = [baseURLString stringByAppendingString:backdropURLString];
//
//NSURL *backdropURL = [NSURL URLWithString:completeBackdropURLString];
//
//// Set image using function from AFNerwork using URL
//[self.backdropView setImageWithURL:backdropURL];
//
//// Set remaining properties of the Details View Controller
//self.titleLabel.text = self.movie[@"title"];
//self.synopsisLabel.text = self.movie[@"overview"];
//self.dateLabel.text = self.movie[@"release_date"];
//
//// Function that adjusts label to fill content
//[self.titleLabel sizeToFit];
//[self.synopsisLabel sizeToFit];

@end

