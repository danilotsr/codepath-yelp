//
//  DRBusiness.h
//  Yelp
//
//  Created by Danilo Resende on 2/11/15.
//  Copyright (c) 2015 CodePath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DRBusiness : NSObject

@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *ratingImageUrl;
@property (nonatomic, assign) NSInteger numReviews;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *categories;
@property (nonatomic, assign) float distance;

+ (NSArray *)businessesWithDictionaries:(NSArray *)dictionaries;

@end