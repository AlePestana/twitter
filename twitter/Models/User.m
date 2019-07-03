//
//  User.m
//  twitter
//
//  Created by marialepestana on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "User.h"

@implementation User

// Initializer
    // Initializes the name and screen name properties with the ones returned with the API dictionary
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        self.profileImage = dictionary[@"profile_image_url_https"];
    }
    return self;
}

@end
