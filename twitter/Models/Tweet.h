//
//  Tweet.h
//  twitter
//
//  Created by marialepestana on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface Tweet : NSObject

// ID - for favoriting, retweeting & replying
@property (nonatomic, strong) NSString *idStr;
// Text - text content of tweet
@property (strong, nonatomic) NSString *text;
// Favorite count - update favorite count label
@property (nonatomic) int favoriteCount;
// Favorited button - configure favorite button
@property (nonatomic) BOOL favorited;
// Retweeted count - pdate favorite count label
@property (nonatomic) int retweetCount;
// Retweet button - configure retweet button
@property (nonatomic) BOOL retweeted;
// User - Contains name, screenname, etc. of tweet author
@property (strong, nonatomic) User *user;
// Date
@property (strong, nonatomic) NSString *createdAtString;

// Retweets - user who retweeted if tweet is retweet
@property (strong, nonatomic) User *retweetedByUser;

// Methods
    // Method that will return some type of this object
    // Such as ID, it returns a pointer to an object
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

    // Factory method - only owned by the class, not the instance
+ (NSMutableArray *)tweetsWithArray:(NSArray *)dictionaries;

@end

NS_ASSUME_NONNULL_END
