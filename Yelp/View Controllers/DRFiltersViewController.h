//
//  DRFiltersViewController.h
//  Yelp
//
//  Created by Danilo Resende on 2/16/15.
//  Copyright (c) 2015 CodePath. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DRFiltersViewController;

@protocol DRFiltersViewControllerDelegate <NSObject>

- (void)filtersViewController:(DRFiltersViewController *)filtersViewController
             didChangeFilters:(NSDictionary *)filters;

@end

@interface DRFiltersViewController : UIViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
              filters:(NSDictionary *)filters;
@property (nonatomic, weak) id<DRFiltersViewControllerDelegate> delegate;

@end