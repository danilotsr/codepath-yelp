//
//  DRFilterSection.h
//  Yelp
//
//  Created by Danilo Resende on 2/17/15.
//  Copyright (c) 2015 CodePath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DRFilterSection : NSObject

@property (nonatomic, readonly, strong) NSString *title;
@property (nonatomic, readonly, strong) NSString *key;
@property (nonatomic, readonly, strong) NSArray* values;
@property (nonatomic, readonly, assign) BOOL mutuallyExclusive;

- (id)initWithTitle:(NSString *)title
                key:(NSString *)key
             values:(NSArray *)values
  mutuallyExclusive:(BOOL)mutuallyExclusive
      presetFilters:(NSDictionary *)presetFilters;

- (NSDictionary *)getFilterDictionary;
- (void)registerForTableView:(UITableView *)tableView;
- (UITableViewCell *)tableView:(UITableView *)tableView cellAtIndexPath:(NSIndexPath *)indexPath;

@end