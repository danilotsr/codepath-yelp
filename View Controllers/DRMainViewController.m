//
//  DRMainViewController.m
//  Yelp
//
//  Created by Danilo Resende on 2/9/15.
//  Copyright (c) 2015 CodePath. All rights reserved.
//

#import "DRMainViewController.h"
#import "DRBusinessCell.h"
#import "YelpClient.h"
#import "DRFiltersViewController.h"

NSString * const kYelpConsumerKey = @"vxKwwcR_NMQ7WaEiQBK_CA";
NSString * const kYelpConsumerSecret = @"33QCvh5bIF5jIHR5klQr7RtBDhQ";
NSString * const kYelpToken = @"uRcRswHFYa1VkDrGV6LAW2F8clGh5JHV";
NSString * const kYelpTokenSecret = @"mqtKIxMIR4iBtBPZCmCLEb-Dz3Y";

@interface DRMainViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, DRFiltersViewControllerDelegate>

@property (nonatomic, strong) NSDictionary *filters;
@property (nonatomic, strong) NSArray *businesses;
@property (nonatomic, strong) YelpClient *client;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (void)searchWithTerm:(NSString *)term params:(NSDictionary *)params;
@end

@implementation DRMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.client = [[YelpClient alloc] initWithConsumerKey:kYelpConsumerKey
                                               consumerSecret:kYelpConsumerSecret
                                                  accessToken:kYelpToken
                                                 accessSecret:kYelpTokenSecret];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIColor *kYelpRedColor = [UIColor colorWithRed:196/256.0 green:18/256.0 blue:0 alpha:1];
    self.navigationController.navigationBar.barTintColor = kYelpRedColor;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    self.navigationController.navigationBar.translucent = NO;

    UIBarButtonItem *filtersButton = [[UIBarButtonItem alloc] initWithTitle:@"Filters"
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(onFiltersTapped)];
    filtersButton.tintColor = [UIColor whiteColor];
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:self.navigationController.navigationBar.frame];
    self.navigationItem.leftBarButtonItem = filtersButton;
    self.navigationItem.titleView = self.searchBar;
    self.searchBar.delegate = self;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"DRBusinessCell" bundle:nil] forCellReuseIdentifier:@"DRBusinessCell"];

    self.tableView.estimatedRowHeight = 90;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self searchWithTerm:nil params:nil];
}

- (void)searchWithTerm:(NSString *)term params:(NSDictionary *)params {
    NSString *searchQuery = term;
    if (!term || term.length == 0) {
        searchQuery = @"Restaurants";
    }
    
    [self.client searchWithTerm:searchQuery
                         params:params
                        success:
     ^(AFHTTPRequestOperation *operation, id response) {
        self.businesses = [DRBusiness businessesWithDictionaries:response[@"businesses"]];
        [self.tableView reloadData];
    }
                        failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.businesses count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DRBusinessCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DRBusinessCell" forIndexPath:indexPath];
    cell.business = self.businesses[indexPath.row];
    return cell;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [self searchWithTerm:searchText params:self.filters];
}

- (void)onFiltersTapped {
    DRFiltersViewController *filtersVC = [[DRFiltersViewController alloc] initWithNibName:@"DRFiltersViewController"
                                                                               bundle:nil
                                                                              filters:self.filters];
    filtersVC.delegate = self;
    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:filtersVC];
    [self.navigationController presentViewController:navigationVC animated:YES completion:nil];
}

- (void)filtersViewController:(DRFiltersViewController *)filtersViewController
             didChangeFilters:(NSDictionary *)filters {
    self.filters = filters;
    [self searchWithTerm:self.searchBar.text params:self.filters];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
