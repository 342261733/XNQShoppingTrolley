//
//  XNQSubNavViewController.m
//  StoreSystem
//
//  Created by xunianqiang on 15/5/7.
//  Copyright (c) 2015年 xunianqiang. All rights reserved.
//

#import "XNQSubNavViewController.h"
#import <UIKit/UIKit.h>

@interface XNQSubNavViewController ()

@end

@implementation XNQSubNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initNav];
}

-(void)initNav
{
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];

    [backButton setFrame:CGRectMake(0, 0, 10, 19)];
    [backButton setTag:200];
    [backButton addTarget:self action:@selector(navButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem =[[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}

-(void)navButton:(id)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
