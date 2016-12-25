//
//  XNQShoppingTrolleyViewController.m
//  StoreSystem
//
//  Created by xunianqiang on 15/5/8.
//  Copyright (c) 2015年 xunianqiang. All rights reserved.
//

#import "XNQShoppingTrolleyViewController.h"

#import "XNQShopTrolleyHeaderTableViewCell.h"
#import "XNQShoppingTrolleyCenterTableViewCell.h"

#define XNQ_WIDTH [[UIScreen mainScreen] bounds].size.width
#define XNQ_HEITHT [[UIScreen mainScreen] bounds].size.height

#define HEADERCELLTAG 10000

@interface XNQShoppingTrolleyViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *myTableView;

@end

#define HEADERCELLTAG 10000
#define HEADEREDITTTAG 10100

@implementation XNQShoppingTrolleyViewController
{
    NSMutableArray *_selectedIndexPathArray;
    NSMutableArray *_selectSectionArray;//选中头部视图部分
    NSMutableArray *_editSectionArray;//存所有的点击编辑按钮section
    
    NSInteger _sectionNum;
    NSInteger _cellNum;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initVariable];
    [self initNav];
    [self initViews];
}

-(void)initVariable
{
    _selectedIndexPathArray = [[NSMutableArray alloc]init];
    _selectSectionArray = [[NSMutableArray alloc]init];
    _editSectionArray = [[NSMutableArray alloc] init];
    _sectionNum = 5;
    _cellNum = 2;
}

-(void)initNav
{
    self.navigationItem.title = @"购物车";
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton setFrame:CGRectMake(0, 0, 10, 19)];
    [backButton setTag:200];
    [backButton addTarget:self action:@selector(navButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem =[[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [editButton setFrame:CGRectMake(0, 0, 70, 30)];
    [editButton setTitle:@"编辑全部" forState:UIControlStateNormal];
    editButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [editButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [editButton addTarget:self action:@selector(editAll:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem =[[UIBarButtonItem alloc]initWithCustomView:editButton];
    self.navigationItem.rightBarButtonItem = rightItem;
}

-(void)editAll:(id)sender
{
    NSLog(@"hello");
}

-(void)navButton:(id)sender
{
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


-(void)initViews
{
    self.myTableView = [[UITableView alloc]init];
    self.myTableView.frame = CGRectMake(0, 0, XNQ_WIDTH, XNQ_HEITHT-59);
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self.view addSubview:self.myTableView];
    
    [self.selectAllButton setImage:[UIImage imageNamed:@"radiobuttons_pressed"] forState:UIControlStateSelected];
    
    [self.view bringSubviewToFront:self.bgImageView];
    [self.view bringSubviewToFront:self.selectAllButton];
    [self.view bringSubviewToFront:self.totalPriceLabel];
    [self.view bringSubviewToFront:self.settleUpToBillButton];
    [self.view bringSubviewToFront:self.allLabel];
    [self.view bringSubviewToFront:self.totalLabel];
    [self.view bringSubviewToFront:self.rmbLabel];
    [self.view bringSubviewToFront:self.noFare];
    
}

#pragma mark - tableView
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 92.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15.0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, XNQ_WIDTH, 44)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.userInteractionEnabled = YES;
    
    //    [bgView setBackgroundColor:[UIColor redColor]];
    XNQShopTrolleyHeaderTableViewCell *  cell = [[[NSBundle mainBundle] loadNibNamed:@"XNQShopTrolleyHeaderTableViewCell" owner:self options:nil] lastObject];
    //    cell.backgroundColor = [UIColor clearColor];
    //    cell.contentView.backgroundColor = [UIColor clearColor];
    //    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.frame = CGRectMake(0, 0, XNQ_WIDTH, cell.frame.size.height);
    [cell.selectButton addTarget:self action:@selector(headerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.selectButton.tag = section+HEADERCELLTAG;
    cell.editButton.tag = section + HEADEREDITTTAG;
    if ([_editSectionArray indexOfObject:[NSNumber numberWithInteger:section]]!=NSNotFound) {
        [cell.editButton setTitle:@"完成" forState:UIControlStateNormal];
    }
    [cell.editButton addTarget:self action:@selector(headerEditClick:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:cell];
    
    UIImageView *barView = [[UIImageView alloc]initWithFrame:CGRectMake(0, bgView.frame.size.height-1, bgView.frame.size.width, 1)];
    [barView setBackgroundColor:[UIColor colorWithRed:238.0/255 green:238.0/255  blue:238.0/255  alpha:1.0]];
    [bgView addSubview:barView];
    
    
    UITapGestureRecognizer *myTapHeader = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHeader:)];
    [bgView addGestureRecognizer:myTapHeader];
    
    return bgView;
}

#pragma mark - cell headerView click
-(void)headerBtnClick:(UIButton *)button
{
    for (NSNumber *currentNumber  in _selectSectionArray) {//取消选中
        if ([currentNumber integerValue] == (button.tag-HEADERCELLTAG)) {
            [button setSelected:NO];
            [_selectSectionArray removeObject:currentNumber];
            
            NSMutableArray *removeArr = [[NSMutableArray alloc]init];
            for (NSIndexPath *currentIndexPath  in _selectedIndexPathArray) {
                if (currentIndexPath.section == (button.tag-HEADERCELLTAG)) {
                    [removeArr addObject:currentIndexPath];
       
                }
            }
            [_selectedIndexPathArray removeObjectsInArray:removeArr];
            [_myTableView reloadData];
            
            return;
        }
    }
    //选中
    [_selectSectionArray addObject:[NSNumber numberWithInteger:button.tag - HEADERCELLTAG]];
    [button setSelected:YES];
    //选中section下面的cell
    for (int i = 0; i<_cellNum; i++) {
        [_selectedIndexPathArray addObject:[NSIndexPath indexPathForRow:i inSection:button.tag -HEADERCELLTAG]];
    }
    
    [_myTableView reloadData];
    
}

-(void)headerEditClick:(UIButton *)btn
{
    for (NSNumber *currentNumber in _editSectionArray) {
        if ([currentNumber integerValue] == btn.tag - HEADEREDITTTAG) {
            [_editSectionArray removeObject:currentNumber];
            //            更新数量
//            
            [_myTableView reloadData];
            return;
        }
    }
    [_editSectionArray addObject:[NSNumber numberWithInteger:btn.tag-HEADEREDITTTAG]];//添加的是section
    
    [_myTableView reloadData];
    
}


-(void)tapHeader:(UITapGestureRecognizer *)tap
{
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return _sectionNum;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    return _cellNum;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ShoppingCell";
    XNQShoppingTrolleyCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"XNQShoppingTrolleyCenterTableViewCell" owner:self options:nil] lastObject];
        cell.backgroundColor = [UIColor clearColor];
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    if (_editSectionArray.count != 0) {
        if ([_editSectionArray indexOfObject:[NSNumber numberWithInteger:indexPath.section]] != NSNotFound) {
            [cell setNumViewHiden:NO];
        }
    }
    cell.btnBlock = ^(void)
    {
        NSLog(@"delete click");
        
        
    };
    cell.currentAccountNumberBlock = ^(NSString *currentAccountNum)
    {
        NSLog(@"change account %@",currentAccountNum);
    };

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XNQShoppingTrolleyCenterTableViewCell *currentCell = (XNQShoppingTrolleyCenterTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%lu %lu",indexPath.section,indexPath.row);
    for (NSIndexPath *myIndexPath in _selectedIndexPathArray) {
        if (myIndexPath == indexPath) {
            [currentCell.selectButton setSelected:NO];
            [_selectedIndexPathArray removeObject:myIndexPath];
            
            //全部取消，头部取消
            NSInteger cancelSection = indexPath.section;
            NSInteger totalSectionRow = 0;
            for (int i=0; i<_selectedIndexPathArray.count; i++) {
                NSIndexPath *currentIndex = _selectedIndexPathArray[i];
                if (currentIndex.section == cancelSection) {
                    totalSectionRow ++;
                }
            }
            if (totalSectionRow == 0) {
                [_selectSectionArray removeObject:[NSNumber numberWithInteger:cancelSection]];
                [tableView reloadData];
            }
            return;
        }
    }
    
    [_selectedIndexPathArray addObject:indexPath];

    [currentCell.selectButton setSelected:YES];
    
    //选中全部 头部选中
    NSInteger addSection = indexPath.section;
    NSInteger totalSectionRow = 0;
    for (int i=0; i<_selectedIndexPathArray.count; i++) {
        NSIndexPath *currentIndex = _selectedIndexPathArray[i];
        if (currentIndex.section == addSection) {
            totalSectionRow ++;
        }
    }
    if (totalSectionRow == _cellNum) {
        [_selectSectionArray addObject:[NSNumber numberWithInteger:addSection]];
        [tableView reloadData];
    }
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    for (NSIndexPath *myindexPath in _selectedIndexPathArray) {
        if (myindexPath == indexPath) {
            XNQShoppingTrolleyCenterTableViewCell *myCell = (XNQShoppingTrolleyCenterTableViewCell *)cell;
            [myCell.selectButton setSelected:YES];
        }
    }
}

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    for (NSNumber *currentNum in _selectSectionArray) {
        if ([currentNum integerValue] == section) {
            UIButton *btn = (UIButton *)[view viewWithTag:section+HEADERCELLTAG];
            [btn setSelected:YES];
        }
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClick:(id)sender {
    UIButton *btn = (UIButton *)sender;
    if (btn.tag == 300) {
        //结算
        NSLog(@"_selectSectionArray %@",_selectSectionArray);
        NSLog(@"_selectedIndexPathArray %@",_selectedIndexPathArray);
    }
    else if (btn.tag == 301)
    {
        //选中all
        static NSInteger flag = 0;
        if (flag%2 == 0) {
            [btn setSelected:YES];
            for (int i=0; i<_sectionNum; i++) {
                [_selectSectionArray addObject:[NSNumber numberWithInteger:i]];
                for (int j=0; j<_cellNum; j++) {
                    [_selectedIndexPathArray addObject:[NSIndexPath indexPathForRow:j inSection:i]];
                }
            }
        }
        else{
            [btn setSelected:NO];
            [_selectSectionArray removeAllObjects];
            [_selectedIndexPathArray removeAllObjects];
        }
        flag ++;

        [_myTableView reloadData];
        
    }
}
@end
