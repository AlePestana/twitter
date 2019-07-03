//
//  ComposeViewController.m
//  twitter
//
//  Created by marialepestana on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"

@interface ComposeViewController ()
    // Close action declaration
- (IBAction)close:(UIBarButtonItem *)sender;

    // Post tweet action declaration
- (IBAction)postTweet:(UIBarButtonItem *)sender;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// Function that calls a method to close the view controller
- (IBAction)close:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}


- (IBAction)postTweet:(UIBarButtonItem *)sender {
}
@end
