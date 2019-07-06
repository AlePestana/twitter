//
//  User.h
//  twitter
//
//  Created by marialepestana on 7/1/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

// Properties
    // Name
@property (strong, nonatomic) NSString *name;
    // Screen name
@property (strong, nonatomic) NSString *screenName;
    // User profile image
@property (weak, nonatomic) NSString *profileImage;
    // User header image
@property (weak, nonatomic) NSString *headerImage;
    // User followers
@property (weak, nonatomic) NSNumber *followers;
    // User following
@property (weak, nonatomic) NSNumber *following;


// Initializer
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END
