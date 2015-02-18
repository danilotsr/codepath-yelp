//
//  YelpClient.m
//  Yelp
//
//  Created by Danilo Resende on 2/13/15.
//  Copyright (c) 2015 CodePath. All rights reserved.
//

#import "YelpClient.h"

@implementation YelpClient

- (id)initWithConsumerKey:(NSString *)consumerKey
           consumerSecret:(NSString *)consumerSecret
              accessToken:(NSString *)accessToken
             accessSecret:(NSString *)accessSecret {
    NSURL *baseURL = [NSURL URLWithString:@"http://api.yelp.com/v2/"];
    self = [super initWithBaseURL:baseURL consumerKey:consumerKey consumerSecret:consumerSecret];
    if (self) {
        BDBOAuth1Credential *token = [BDBOAuth1Credential credentialWithToken:accessToken secret:accessSecret expiration:nil];
        [self.requestSerializer saveAccessToken:token];
    }
    return self;
}

- (AFHTTPRequestOperation *)searchWithTerm:(NSString *)term
                                    params:(NSDictionary *)params
                                   success:(void (^)(AFHTTPRequestOperation *operation, id response))success
                                   failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    
    // For additional parameters, see http://www.yelp.com/developers/documentation/v2/search_api
    NSDictionary *defaults = @{@"ll" : @"40.7593170,-73.9961580"};
    NSMutableDictionary *allParameters = [defaults mutableCopy];
    if (term) {
        [allParameters setObject:term forKey:@"term"];
    }
    if (params) {
        [allParameters addEntriesFromDictionary:params];
    }
    NSLog(@"YelpClient, params: %@", allParameters);
    return [self GET:@"search" parameters:allParameters success:success failure:failure];
}

@end