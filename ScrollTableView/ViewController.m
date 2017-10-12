//
//  ViewController.m
//  ScrollTableView
//
//  Created by 孙晓康 on 2017/8/2.
//  Copyright © 2017年 Admin. All rights reserved.
//

#import "ViewController.h"
#import "ScrollTableBaseViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *tempBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tempBtn.frame = CGRectMake(100, 100, 100, 100);
    tempBtn.backgroundColor = [UIColor orangeColor];
    
    [tempBtn setTitle:@"点击" forState:UIControlStateNormal];
    
    [tempBtn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:tempBtn];
    
}


- (void)clickBtn {
    
    ScrollTableBaseViewController *scrollTableVC = [[ScrollTableBaseViewController alloc] init];
    
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:scrollTableVC];
    [self presentViewController:navi animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
