//
//  ComposeViewController.h
//  twitter
//
//  Created by marialepestana on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

// Create protocol
@protocol ComposeViewControllerDelegate

- (void)didTweet:(Tweet *)tweet;

@end


@interface ComposeViewController : UIViewController

@property (weak, nonatomic) id<ComposeViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
