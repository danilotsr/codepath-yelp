//
//  DRFiltersViewController.m
//  Yelp
//
//  Created by Danilo Resende on 2/16/15.
//  Copyright (c) 2015 CodePath. All rights reserved.
//

#import "DRFiltersViewController.h"
#import "DRFilterSection.h"
#import "DRFilterConstants.h"

@interface DRFiltersViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong, readonly) NSDictionary *filtersDictionary;
@property (nonatomic, strong) NSArray *filterSections;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DRFiltersViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil filters:(NSDictionary *)filters {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.filterSections = @[
                                [[DRFilterSection alloc] initWithTitle:@"Distance"
                                                                   key:[DRFilterConstants distanceKey]
                                                                values:[DRFilterConstants distanceValues]
                                                     mutuallyExclusive:YES
                                                         presetFilters:filters],
                                [[DRFilterSection alloc] initWithTitle:@"Sort By"
                                                                   key:[DRFilterConstants sortingKey]
                                                                values:[DRFilterConstants sortingValues]
                                                     mutuallyExclusive:YES
                                                         presetFilters:filters],
                                [[DRFilterSection alloc] initWithTitle:@"Categories"
                                                                   key:[DRFilterConstants categoryKey]
                                                                values:[DRFilterConstants categoryValues]
                                                     mutuallyExclusive:NO
                                                         presetFilters:filters],
                                [[DRFilterSection alloc] initWithTitle:@"Deals"
                                                                   key:[DRFilterConstants dealKey]
                                                                values:[DRFilterConstants dealValues]
                                                     mutuallyExclusive:YES
                                                         presetFilters:filters],
                                ];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [DRFilterConstants backgroundRedColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationItem.title = @"Filters";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(onCancelButton)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Apply"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(onApplyButton)];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.sectionHeaderHeight = 40;
    
    for (DRFilterSection *filterSection in self.filterSections) {
        [filterSection registerForTableView:self.tableView];
    }
}

- (NSDictionary *)filtersDictionary {
    NSMutableDictionary *filters = [NSMutableDictionary dictionary];
    for (DRFilterSection *filterSection in self.filterSections) {
        [filters addEntriesFromDictionary:[filterSection getFilterDictionary]];
    }
    return filters;
}

- (void)onCancelButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)onApplyButton {
    [self.delegate filtersViewController:self didChangeFilters:self.filtersDictionary];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    DRFilterSection *filterSection = self.filterSections[section];
    return filterSection.title;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    DRFilterSection *filterSection = self.filterSections[section];
    return filterSection.values.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.filterSections.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DRFilterSection *filterSection = self.filterSections[indexPath.section];
    return [filterSection tableView:tableView cellAtIndexPath:indexPath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
