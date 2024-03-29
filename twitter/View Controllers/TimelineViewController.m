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
#import "ComposeViewController.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "NSDate+DateTools.h"
#import "DetailTweetViewController.h"


@interface TimelineViewController () < ComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

    // Tweets array
@property (strong, nonatomic) NSMutableArray *tweets;

    // Table view
@property (weak, nonatomic) IBOutlet UITableView *tableView;

    // Refresh control
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end


@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Data source and delegate setup
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self fetchTweets];
    
    // Refresh control initialization
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl
        addTarget:self
     action:@selector(beginRefresh:)
        forControlEvents:UIControlEventValueChanged
    ];
    [self.tableView insertSubview:self.refreshControl atIndex:0];

}


// Function that fetches the tweets
- (void)fetchTweets {

    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweetsFetched, NSError *error) {
        
        if (tweetsFetched) {
            // Save tweets in tweets array from API
            self.tweets = [NSMutableArray arrayWithArray:tweetsFetched];
            // Update user interface (UI)
            [self.tableView reloadData];
            
        } else {
            NSLog(@"Error getting home timeline: %@", error.localizedDescription);
            
        }
        [self.refreshControl endRefreshing];
        
    }];
    
}

// Function that makes a network request to get updated data
// Updates the tableView with the new data
// Hides the RefreshControl
- (void)beginRefresh:(UIRefreshControl *)refreshControl {
        
    [self fetchTweets];
          // Reload the tableView now that there is new data
          // [self.tableView reloadData];
           // Tell the refreshControl to stop spinning
          // [self.refreshControl endRefreshing];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Protocol method that returns the amount of tweets (20)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Returns the number of tweets I have on my tweets array
    return self.tweets.count;
}


// Protocol method that returns the cell with all its information
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Deque cell
    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell" forIndexPath:indexPath];
    
    // Update cell with tweet data
    Tweet *tweet = self.tweets[indexPath.row];
    cell.tweet = tweet;
   
    // Return cell to the table view
    return cell;
}


// Method called after composing a tweet
// Receives the tweet and adds it to tweets array and cell
- (void)didTweet:(Tweet *)tweet {
    // self.tweets[self.tweets.count] = tweet;
    
    [self.tweets insertObject:tweet atIndex:0];
    
    [self.tableView reloadData];
    
}
#pragma mark - Navigation


// Function that allows navigation between screens to occur
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"composeSegue"]) {
    
        UINavigationController *navigationController = [segue destinationViewController];
        ComposeViewController *composeController = (ComposeViewController*)navigationController.topViewController;
        composeController.delegate = self;
    
    } else if ([[segue identifier] isEqualToString:@"detailSegue"]) {
        UITableViewCell *tappedCell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:tappedCell];
        Tweet *tweet = self.tweets[indexPath.row];
        
        DetailTweetViewController *detailsViewController = [segue destinationViewController];
        detailsViewController.tweet = tweet;
        NSLog(@"Success");
    }
}


@end
