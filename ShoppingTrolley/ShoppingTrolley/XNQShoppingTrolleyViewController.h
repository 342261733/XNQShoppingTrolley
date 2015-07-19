//
//  XNQShoppingTrolleyViewController.h
//  StoreSystem
//
//  Created by xunianqiang on 15/5/8.
//  Copyright (c) 2015年 xunianqiang. All rights reserved.
//

#import "XNQSubNavViewController.h"

@interface XNQShoppingTrolleyViewController : XNQSubNavViewController

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UIButton *selectAllButton;
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;

@property (weak, nonatomic) IBOutlet UIButton *settleUpToBillButton;

@property (weak, nonatomic) IBOutlet UILabel *allLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UILabel *rmbLabel;
@property (weak, nonatomic) IBOutlet UILabel *noFare;



- (IBAction)btnClick:(id)sender;


@end
