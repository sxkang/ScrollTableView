//
//  ScrollTableBaseViewController.m
//  ScrollTableView
//
//  Created by 孙晓康 on 2017/8/3.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import "ScrollTableBaseViewController.h"

#import "ScrollTableViewHeaderView.h"

#import "ScrolltableLeftTableViewCell.h"
#import "ScrollTableRightTableViewCell.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#define HEADERVIEWHEIGHT 0
#define TITLELABELWIDTH 90

#define CELLHEIGHT 60

@interface ScrollTableBaseViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UITableView *rightTableView;

@property (nonatomic, strong) UIScrollView* rightScrollView;

@end

@implementation ScrollTableBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _dataArr = [[NSArray alloc] init];
    NSMutableArray *tempArr = [[NSMutableArray alloc] init];
    //测试
    for (int i = 0; i< 20; i++) {
        
        [tempArr addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    
    _dataArr = tempArr.copy;
    
    [self cretaeTableView];
}

- (void)goBack {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)cretaeTableView {
    
    UITableView *leftTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, HEADERVIEWHEIGHT + 64, TITLELABELWIDTH, [UIScreen mainScreen].bounds.size.height - HEADERVIEWHEIGHT - 64) style:UITableViewStylePlain];
    
    leftTableV.delegate = self;
    leftTableV.dataSource = self;
    leftTableV.tag = 100;
    leftTableV.showsVerticalScrollIndicator = NO;
    leftTableV.showsHorizontalScrollIndicator = NO;
  //  leftTableV.bounces = NO;
    
    _leftTableView = leftTableV;
    
    [self.view addSubview:leftTableV];
    
    UITableView *righttableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, TITLELABELWIDTH * 7, [UIScreen mainScreen].bounds.size.height - HEADERVIEWHEIGHT - 64) style:UITableViewStylePlain];
    
    righttableV.delegate = self;
    righttableV.dataSource = self;
    righttableV.tag = 101;
    
    _rightTableView = righttableV;
    
    UIScrollView *rightScrollV = [[UIScrollView alloc] initWithFrame:CGRectMake(TITLELABELWIDTH, HEADERVIEWHEIGHT + 64, ScreenWidth - TITLELABELWIDTH, [UIScreen mainScreen].bounds.size.height - HEADERVIEWHEIGHT - 64)];
    
    rightScrollV.showsVerticalScrollIndicator = NO;
    rightScrollV.showsHorizontalScrollIndicator = NO;
   // rightScrollV.bounces = NO;
    rightScrollV.contentSize = righttableV.frame.size;
    rightScrollV.delegate = self;
    rightScrollV.tag = 102;
    [rightScrollV addSubview:righttableV];
    
    _rightScrollView = rightScrollV;
    
    [self.view addSubview:rightScrollV];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return CELLHEIGHT;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 60.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (tableView.tag == 100) {
        
        ScrollTableViewHeaderView *headerView = [[ScrollTableViewHeaderView alloc] initWithFrame:CGRectMake(0, 0, TITLELABELWIDTH, 60.0) withTitleArr:@[@"排名"]];
        
        return headerView;
    }else {
        
        ScrollTableViewHeaderView *headerView = [[ScrollTableViewHeaderView alloc] initWithFrame:CGRectMake(0, 0, TITLELABELWIDTH * 7, 60.0) withTitleArr:@[@"测试测试01",@"测试测试02",@"测试测试03",@"测试测试04",@"测试测试01",@"测试测试02",@"测试测试03"]];
        
        return headerView;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView.tag == 100) {
       
        static NSString *cellId = @"ScrolltableLeftTableViewCell";
        
        ScrolltableLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        
        if (cell == nil) {
            
            cell = [[ScrolltableLeftTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        
        cell.rankStr = [NSString stringWithFormat:@"%ld",indexPath.row];
        
        return cell;
        
    }else if (tableView.tag == 101) {
        
        static NSString *cellId = @"ScrollTableRightTableViewCell";
        
        ScrollTableRightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
        if (cell == nil) {
            
            cell = [[ScrollTableRightTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        }
        
        cell.cellLabelCount = 7;
        
        return cell;
        
    }
    
    assert(0);
    return nil;
    
}


#pragma mark ScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (scrollView == _leftTableView) {
        
        [self tableView:_rightTableView scrollFollowTheOther:_leftTableView];
    }else {
        
//        scrollView.bounces = (scrollView.contentOffset.x <= 0) ? NO : YES;
        [self tableView:_leftTableView scrollFollowTheOther:_rightTableView];
    }
}

- (void)tableView:(UIScrollView *)tableView scrollFollowTheOther:(UIScrollView *)other{
    CGFloat offsetY= other.contentOffset.y;
    CGPoint offset=tableView.contentOffset;
    offset.y=offsetY;
    tableView.contentOffset=offset;
}

@end
