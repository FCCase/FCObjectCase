//
//  FCObjectCaseTableViewCell.m
//  FCObjectCase
//
//  Created by 石富才 on 2020/12/19.
//

#import "FCObjectCaseTableViewCell.h"

@implementation FCObjectCaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellM:(FCTableViewCellModel *)cellM{
    [super setCellM:cellM];
    self.textLabel.numberOfLines = 0;
    self.textLabel.attributedText = cellM.titleAttri;
}

@end
