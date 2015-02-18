//
//  DRSwitchCell.m
//  Yelp
//
//  Created by Danilo Resende on 2/16/15.
//  Copyright (c) 2015 CodePath. All rights reserved.
//

#import "DRSwitchCell.h"

@interface DRSwitchCell ()

@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;
- (IBAction)switchValueChanged:(id)sender;

@end

@implementation DRSwitchCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)switchValueChanged:(id)sender {
    [self.delegate switchCell:self didChangeValue:self.toggleSwitch.on];
}

- (BOOL)on {
    return self.toggleSwitch.on;
}

- (void)setOn:(BOOL)on {
    [self setOn:on animated:NO];
}

- (void)setOn:(BOOL)on animated:(BOOL)animated {
    [self.toggleSwitch setOn:on animated:animated];
}

- (BOOL)enabled {
    return self.toggleSwitch.enabled;
}

- (void)setEnabled:(BOOL)enabled {
    self.toggleSwitch.enabled = enabled;
}

@end
