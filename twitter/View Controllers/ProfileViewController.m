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

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
