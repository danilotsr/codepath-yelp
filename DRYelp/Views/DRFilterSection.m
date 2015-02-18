//
//  DRFilterSection.m
//  Yelp
//
//  Created by Danilo Resende on 2/17/15.
//  Copyright (c) 2015 CodePath. All rights reserved.
//

#import "DRFilterSection.h"
#import "DRSwitchCell.h"

@interface DRFilterSection() <DRSwitchCellDelegate>

@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) NSMutableSet *selectedIndexes;
@property (nonatomic, strong) DRSwitchCell* lastSelectedCell;

- (void)presetFromFilterDictionary:(NSDictionary *)dict;
- (void)presetMutuallyExclusiveFromFilterDictionary:(NSDictionary *)dict;
- (void)presetNormalFromFilterDictionary:(NSDictionary *)dict;
- (NSInteger)indexOfCell:(DRSwitchCell *)cell;
- (NSInteger)indexOfValueWithKey:(NSString *)key;

@end

@implementation DRFilterSection

- (id)initWithTitle:(NSString *)title
                key:(NSString *)key
             values:(NSArray *)values
  mutuallyExclusive:(BOOL)mutuallyExclusive
      presetFilters:(NSDictionary *)presetFilters {
    
    self = [super init];
    if (self) {
        _title = title;
        _values = values;
        _key = key;
        _mutuallyExclusive = mutuallyExclusive;

        [self presetFromFilterDictionary:presetFilters];
    }
    return self;
}

- (void)registerForTableView:(UITableView *)tableView {
    // This will register a different UINib object for the same identifier, DRSwitchCell, as many times as there are
    // sections in the table. This is probably harmless here, but it is a bad practice.
    [tableView registerNib:[UINib nibWithNibName:@"DRSwitchCell" bundle:nil] forCellReuseIdentifier:@"DRSwitchCell"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellAtIndexPath:(NSIndexPath *)indexPath {
    DRSwitchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DRSwitchCell"
                                                       forIndexPath:indexPath];
    
    cell.titleLabel.text = self.values[indexPath.row][@"name"];
    cell.on = [self isSelectedAtRow:indexPath.row];
    cell.enabled = [self isEnabledAtRow:indexPath.row];
    cell.delegate = self;
    
    if (!self.lastSelectedCell && cell.on) {
        self.lastSelectedCell = cell;
    }

    return cell;
}

- (BOOL)isSelectedAtRow:(NSInteger)row {
    return self.selectedIndex == row || [self.selectedIndexes containsObject:@(row)];
}

- (BOOL)isEnabledAtRow:(NSInteger)row {
    return !self.mutuallyExclusive || ![self isSelectedAtRow:row];
}

- (NSDictionary *)getFilterDictionary {
    if (self.selectedIndex >= 0) {
        return @{self.key: self.values[self.selectedIndex][self.key]};
    } else if (self.selectedIndexes.count > 0) {
        NSMutableArray *selectedValues = [NSMutableArray array];
        for (NSNumber *index in self.selectedIndexes) {
            NSDictionary *dict = self.values[[index integerValue]];
            [selectedValues addObject:dict[self.key]];
        }
        return @{self.key: [selectedValues componentsJoinedByString:@","]};
    }
    return nil;
}

- (void)presetFromFilterDictionary:(NSDictionary *)dict {
    if (self.mutuallyExclusive) {
        [self presetMutuallyExclusiveFromFilterDictionary:dict];
    } else {
        [self presetNormalFromFilterDictionary:dict];
    }
}

- (void)presetMutuallyExclusiveFromFilterDictionary:(NSDictionary *)dict {
    NSString *value = dict[self.key];
    if (value) {
        self.selectedIndex = [self indexOfValueWithKey:value];
    } else {
        self.selectedIndex = 0;
    }
}

- (void)presetNormalFromFilterDictionary:(NSDictionary *)dict {
    self.selectedIndexes = [NSMutableSet set];
    self.selectedIndex = -1;

    NSString *serializedValue = dict[self.key];
    if (serializedValue) {
        NSArray *selectedValues = [serializedValue componentsSeparatedByString:@","];
        for (NSString *value in selectedValues) {
            [self.selectedIndexes addObject:@([self indexOfValueWithKey:value])];
        }
    }
}

- (void)switchCell:(DRSwitchCell *)cell didChangeValue:(BOOL)value {
    NSInteger index = [self indexOfCell:cell];
    if (self.mutuallyExclusive) {
        [self.lastSelectedCell setOn:NO animated:NO];
        self.lastSelectedCell.enabled = YES;
        self.selectedIndex = index;
        self.lastSelectedCell = cell;
        cell.enabled = !value;
    } else if (value) {
        [self.selectedIndexes addObject:@(index)];
    } else {
        [self.selectedIndexes removeObject:@(index)];
    }
}

- (NSInteger)indexOfCell:(DRSwitchCell *)cell {
    for (int i = 0; i < self.values.count; i++) {
        if ([cell.titleLabel.text isEqual:self.values[i][@"name"]]) {
            return i;
        }
    }
    return -1;
}

- (NSInteger)indexOfValueWithKey:(NSString *)key {
    for (int i = 0; i < self.values.count; i++) {
        if ([key isEqual:self.values[i][self.key]]) {
            return i;
        }
    }
    return -1;
}

@end