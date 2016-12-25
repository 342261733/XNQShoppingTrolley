//
//  XNQShopTrolleyHeaderTableViewCell.m
//  StoreSystem
//
//  Created by xunianqiang on 15/5/9.
//  Copyright (c) 2015年 xunianqiang. All rights reserved.
//

#import "XNQShopTrolleyHeaderTableViewCell.h"

@implementation XNQShopTrolleyHeaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.pullDownPaper setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self.editButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [self.selectButton setImage:[UIImage imageNamed:@"radiobuttons_pressed"] forState:UIControlStateSelected];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state

}

@end
