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

@property (weak, nonatomic) IBOutlet UILabel *wordCount;


@end



@implementation ComposeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tweetTextView.delegate = self;
    
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


// Function in charge of all the tasks related to composing and posting a tweet
- (IBAction)postTweet:(UIBarButtonItem *)sender {
    // Print out tweet on the console
    // NSLog( @"%@", [NSString stringWithFormat:@"%@", self.tweetTextView.text]);
    
    [[APIManager shared]postStatusWithText:self.tweetTextView.text completion:^(Tweet *tweet, NSError *error) {
        if(error){
            // NSLog(@"Error composing Tweet: %@", error.localizedDescription);
        }
        else{
            [self.delegate didTweet:tweet];
            // NSLog(@"Compose Tweet Success!");
            
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
    
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    // TODO: Check the proposed new text character count
    // Allow or disallow the new text
    
    // Set the max character limit
    int characterLimit = 140;
    
    // Construct what the new text would be if we allowed the user's latest edit
    NSString *newText = [self.tweetTextView.text stringByReplacingCharactersInRange:range withString:text];
    
    // TODO: Update Character Count Label
    self.wordCount.text = [[NSString stringWithFormat:@"%lu", newText.length] stringByAppendingString:@" of 140"];
    
    // The new text should be allowed? True/False
    return newText.length < characterLimit;
}


@end
