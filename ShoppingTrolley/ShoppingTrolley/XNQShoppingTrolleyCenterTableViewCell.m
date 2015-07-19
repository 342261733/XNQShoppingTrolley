//
//  XNQShoppingTrolleyCenterTableViewCell.m
//  StoreSystem
//
//  Created by xunianqiang on 15/5/9.
//  Copyright (c) 2015年 xunianqiang. All rights reserved.
//

#import "XNQShoppingTrolleyCenterTableViewCell.h"

@implementation XNQShoppingTrolleyCenterTableViewCell

- (void)awakeFromNib {
    // Initialization code
    

    [self.selectButton setImage:[UIImage imageNamed:@"radiobuttons_pressed"] forState:UIControlStateSelected];
    self.selectButton.userInteractionEnabled = NO;



}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state

}

@end
