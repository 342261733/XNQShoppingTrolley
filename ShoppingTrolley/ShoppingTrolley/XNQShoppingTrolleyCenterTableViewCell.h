//
//  XNQShoppingTrolleyCenterTableViewCell.h
//  StoreSystem
//
//  Created by xunianqiang on 15/5/9.
//  Copyright (c) 2015年 xunianqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XNQShoppingTrolleyCenterTableViewCell : UITableViewCell

@property (assign,nonatomic) BOOL isSelect;

@property (weak, nonatomic) IBOutlet UIButton *selectButton;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *myTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *oldPriceLabel;

@property (weak, nonatomic) IBOutlet UILabel *accountNumLabel;//显示数据

@property (weak, nonatomic) IBOutlet UILabel *accountLabel;//可选择数据

@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UIButton *plusButton;
@property (weak, nonatomic) IBOutlet UIButton *minusButton;
@property (weak, nonatomic) IBOutlet UIImageView *bgSliderView;
@property (weak, nonatomic) IBOutlet UIImageView *bgWhiteView;

- (IBAction)btnClick:(id)sender;



-(void)setNumViewHiden:(BOOL)bb;

@property (strong,nonatomic) void(^btnBlock)();
@property (strong,nonatomic) void(^currentAccountNumberBlock)(NSString *currentNum);


@end
