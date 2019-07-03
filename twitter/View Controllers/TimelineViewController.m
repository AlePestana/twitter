//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"
#import "TweetCell.h"
#import "Tweet.h"


@interface TimelineViewController () <UITableViewDataSource, UITableViewDelegate>

// Tweets array
@property (strong, nonatomic) NSArray *tweets;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Data source and delegate setup
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self fetchTweets];
}

- (void)fetchTweets {
    
    // Get timeline
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweetsFetched, NSError *error) {
        
        if (tweetsFetched) {
            
            
            // NSLog(@"Successfully loaded home timeline");
            // for (Tweet *tweet in tweetsFetched) {
            //    NSString *text = tweet[@"text"];
            //    NSLog(@"%@", text);
            // }
                
                // Save tweets in tweets array from API
                self.tweets = tweetsFetched;
                // Update user interface (UI)
                [self.tableView reloadData];
            
    } else {
            NSLog(@"Error getting home timeline: %@", error.localizedDescription);
            
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Returns the number of tweets I have on my tweets array
    return self.tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Deque cell
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell" forIndexPath:indexPath];
    
    // Update cell with tweet data
    Tweet *tweet = self.tweets[indexPath.row];
    // cell.tweet = tweet;
        // "Grab" values from the dictionary
    
        // Assign values to my properties
    cell.authorName.text = tweet.user.name;
    cell.authorAccountName.text = tweet.user.screenName;
    cell.date.text = tweet.createdAtString;
    cell.tweetText.text = tweet.text;
    cell.retweetCount.text = [NSString stringWithFormat:@"%d", tweet.retweetCount];
    cell.favoriteCount.text = [NSString stringWithFormat:@"%d",tweet.favoriteCount];
    //cell.profileImage.image = nil;
    
    NSString *profileImageURL = tweet.user.profileImage;
    
    NSURL *url = [NSURL URLWithString:profileImageURL];
    [cell.profileImage setImageWithURL:url];
    
    // Return cell to the table view
    return cell;
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
