//
//  ViewController.m
//  ShoppingTrolley
//
//  Created by xunianqiang on 15/5/9.
//  Copyright (c) 2015年 xunianqiang. All rights reserved.
//

#import "ViewController.h"
#import "XNQShoppingTrolleyViewController.h"

@interface ViewController ()
- (IBAction)btnClick:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClick:(id)sender {
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:[[XNQShoppingTrolleyViewController alloc]init]] animated: YES completion:nil];
    
}
@end
