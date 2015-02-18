//
//  DRFilterConstants.h
//  Yelp
//
//  Created by Danilo Resende on 2/17/15.
//  Copyright (c) 2015 CodePath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DRFilterConstants : NSObject

+ (UIColor *)backgroundRedColor;

+ (NSString *)distanceKey;
+ (NSString *)sortingKey;
+ (NSString *)categoryKey;
+ (NSString *)dealKey;

+ (NSArray *)distanceValues;
+ (NSArray *)sortingValues;
+ (NSArray *)categoryValues;
+ (NSArray *)dealValues;

@end