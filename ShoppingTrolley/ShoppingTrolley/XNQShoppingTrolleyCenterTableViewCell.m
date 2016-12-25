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
    [super awakeFromNib];
    [self.selectButton setImage:[UIImage imageNamed:@"radiobuttons_pressed"] forState:UIControlStateSelected];
    [self.deleteButton setImage:[UIImage imageNamed:@"addtocart_delete_pressed"] forState:UIControlStateHighlighted];
    self.selectButton.userInteractionEnabled = NO;
    [self setNumViewHiden:YES];
}

- (IBAction)btnClick:(id)sender {
    UIButton *btn =(UIButton *)sender;
    if (btn.tag == 200) {
        //-
        self.accountLabel.text = [NSString stringWithFormat:@"%lu",[self.accountLabel.text integerValue]-1>1?[self.accountLabel.text integerValue]-1:1];
        if (self.currentAccountNumberBlock) {
            self.currentAccountNumberBlock(self.accountLabel.text);
        }
    }
    else if (btn.tag == 201) {
        //+
        self.accountLabel.text = [NSString stringWithFormat:@"%lu",[self.accountLabel.text integerValue]+1];
        if (self.currentAccountNumberBlock) {
            self.currentAccountNumberBlock(self.accountLabel.text);
        }
        
    }
    else if (btn.tag == 202) {
        //delete
        //        [self setNumViewHiden:YES];
        if (self.btnBlock) {
            self.btnBlock();
        }
    }
}


-(void)setNumViewHiden:(BOOL)bb
{
    [self.accountLabel setHidden:bb];
    [self.deleteButton setHidden:bb];
    [self.plusButton setHidden:bb];
    [self.minusButton setHidden:bb];
    [self.bgSliderView setHidden:bb];
    [self.bgWhiteView setHidden:bb];
}

@end
