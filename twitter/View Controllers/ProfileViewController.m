//
//  ProfileViewController.m
//  twitter
//
//  Created by marialepestana on 7/5/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "ProfileViewController.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "TweetCell.h"

@interface ProfileViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *accountName;
@property (weak, nonatomic) IBOutlet UILabel *accountUserName;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UILabel *followingCount;
@property (weak, nonatomic) IBOutlet UILabel *followerCount;




// Tweets array
@property (strong, nonatomic) NSMutableArray *tweets;
// Table view
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Data source and delegate setup
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self fetchTweets];
}


// Function that fetches the tweets
- (void)fetchTweets {
    
    [[APIManager shared] getUsernameWithCompletion:^(NSString *username, NSError *error) {
    
    if(username) {
    
        [[APIManager shared] getUserTimelineWithUsername:username withCompletion:^(NSArray *tweetsAPI, NSError *error) {
            if (tweetsAPI) {
                self.tweets = [NSMutableArray arrayWithArray:tweetsAPI];
                [self.tableView reloadData];
                
                // Set labels and profile image
                Tweet *individualTweet = self.tweets[0];
                User *individualUser = individualTweet.user;
                self.accountName.text = individualUser.name;
                NSString *accountBase = @"@";
                self.accountUserName.text = [accountBase stringByAppendingString:individualUser.screenName];
        
                NSString *profileImageURL = individualUser.profileImage;
                
                self.profileImage.image = nil;
                NSURL *url = [NSURL URLWithString:profileImageURL];
                [self.profileImage setImageWithURL:url placeholderImage:[UIImage imageNamed:@"user_icon.png"]];
                
                self.followerCount.text = [NSString stringWithFormat:@"%@", individualUser.followers];
                self.followingCount.text = [NSString stringWithFormat:@"%@", individualUser.following];
                
//                NSString *headerImageURL = individualUser.headerImage;
//                self.headerImage.image = nil;
//
//                NSURL *urlHeader = [NSURL URLWithString:headerImageURL];
//                [self.headerImage setImageWithURL:urlHeader placeholderImage:[UIImage imageNamed:@"user_icon.png"]];
                
            } else {
                NSLog(@"Error getting user timeline: %@", error.localizedDescription);
            }
    
        }];
    }
        [self.tableView reloadData];
    }];
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




// Function that allows the user to logout of the application
// Connected to "Logout" button on the storyboard
- (IBAction)didTapLogout:(UIBarButtonItem *)sender {
    
    // Setting the root view controller will immediately switch the screen to that view controller
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;
    
    // Clear out access tokens
    [[APIManager shared] logout];
    
}

// Protocol method that returns the amount of tweets (20)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Returns the number of tweets I have on my tweets array
    return self.tweets.count;
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
