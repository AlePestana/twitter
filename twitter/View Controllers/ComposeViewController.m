//
//  ComposeViewController.m
//  twitter
//
//  Created by marialepestana on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "ComposeViewController.h"
#import "APIManager.h"

@interface ComposeViewController () <UITextViewDelegate>
    // Close action declaration
- (IBAction)close:(UIBarButtonItem *)sender;

    // Post tweet action declaration
- (IBAction)postTweet:(UIBarButtonItem *)sender;

    // Tweet text view
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self textViewDidBeginEditing:self.tweetTextView];
    [self textViewDidEndEditing:self.tweetTextView];
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
    [[APIManager shared] postStatusWithText:self.tweetTextView.text completion:nil];
    // Print out tweet on the console
    NSLog( @"%@", [NSString stringWithFormat:@"%@", self.tweetTextView.text]);
}


// Put placeholder on tweet text view

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([self.tweetTextView.text isEqualToString:@"Start typing..."]) {
        self.tweetTextView.text = @"";
        self.tweetTextView.textColor = [UIColor lightGrayColor];
    }
    [self.tweetTextView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if ([self.tweetTextView.text isEqualToString:@""]) {
        self.tweetTextView.text = @"Start typing...";
        self.tweetTextView.textColor = [UIColor lightGrayColor];
    }
    [self.tweetTextView resignFirstResponder];
}

@end
