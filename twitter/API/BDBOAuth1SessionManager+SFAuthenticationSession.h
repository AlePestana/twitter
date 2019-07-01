//
//  BDBOAuth1SessionManager+SFAuthenticationSession.h
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "BDBOAuth1SessionManager.h"

@interface BDBOAuth1SessionManager (SFAuthenticationSession)

/**
 OAuth authentication method using SFAuthenticationSession (iOS 11+).
 It simply calls authenticateWithAuthenticationPath:requestTokenPath:method:accessTokenPath:method: with default values.
 
 authenticationPath: 'oauth/authenticate?oauth_token='
 
 requestTokenPath: 'oauth/request_token'
 
 accessTokenPath: 'oauth/access_token'
 
 http methods: 'POST'

 @param completion Completion block performed once authentication is finalized. It indicates if was successful and includes an error if it wasn't
 */
- (void)loginWithCompletion:(void(^)(BOOL success, NSError * error))completion;

/**
 OAuth authentication method using SFAuthenticationSession (iOS 11+)

 @param authenticationPath Path for authenticating with a request token. The request token will be appended to this path (ie: 'oauth/authenticate?oauth_token=')
 @param requestTokenPath Path to get a request token (ie: 'oauth/request_token')
 @param requestTokenMethod HTTP method for getting request token
 @param accessTokenPath Path to get an access token (ie: 'oauth/access_token')
 @param accessTokenMethod HTTP method for getting access token
 @param completion Completion block performed once authentication is finalized. It indicates if was successful and includes an error if it wasn't
 */
- (void)loginWithAuthenticationPath:(NSString *)authenticationPath
                   requestTokenPath:(NSString *)requestTokenPath
                             method:(NSString *)requestTokenMethod
                    accessTokenPath:(NSString *)accessTokenPath
                             method:(NSString *)accessTokenMethod
                         completion:(void(^)(BOOL success, NSError * error))completion;

/**
 Logs out this manager and removes any stored access token

 @return YES if an access token was found and removed from the keychain, NO otherwise.
 */
- (BOOL)logout;

@end
