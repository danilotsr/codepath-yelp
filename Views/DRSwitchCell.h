//
//  DRSwitchCell.h
//  Yelp
//
//  Created by Danilo Resende on 2/16/15.
//  Copyright (c) 2015 CodePath. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DRSwitchCell;

@protocol DRSwitchCellDelegate <NSObject>

- (void)switchCell:(DRSwitchCell *)cell didChangeValue:(BOOL)value;

@end

@interface DRSwitchCell : UITableViewCell

@property (nonatomic, assign) BOOL on;
@property (nonatomic, assign) BOOL enabled;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) id<DRSwitchCellDelegate> delegate;

- (void)setOn:(BOOL)on animated:(BOOL)animated;

@end
