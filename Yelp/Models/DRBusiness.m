//
//  DRBusiness.m
//  Yelp
//
//  Created by Danilo Resende on 2/11/15.
//  Copyright (c) 2015 CodePath. All rights reserved.
//

#import "DRBusiness.h"

float const kMilesPerMeter = 0.000621371;

@implementation DRBusiness

- (id)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.name = dict[@"name"];
        self.imageUrl = dict[@"image_url"];
        self.ratingImageUrl = dict[@"rating_img_url"];
        self.numReviews = [dict[@"review_count"] integerValue];
        self.address = [dict valueForKeyPath:@"location.display_address"][0];
        NSArray *categories = dict[@"categories"];
        NSMutableArray *categoryNames = [[NSMutableArray alloc] initWithCapacity:[categories count]];
        [categories enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [categoryNames addObject:obj[0]];
        }];
        self.categories = [categoryNames componentsJoinedByString:@", "];
        self.distance = [dict[@"distance"] floatValue] * kMilesPerMeter;
    }
    return self;
}

+ (NSArray *)businessesWithDictionaries:(NSArray *)dictionaries {
    NSMutableArray *businesses = [[NSMutableArray alloc] initWithCapacity:[dictionaries count]];
    for (NSDictionary *dict in dictionaries) {
        DRBusiness *business = [[DRBusiness alloc] initWithDictionary:dict];
        [businesses addObject:business];
    }
    return businesses;
}

@end
