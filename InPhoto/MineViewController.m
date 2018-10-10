//
//  MineViewController.m
//  InPhoto
//
//  Created by shishi on 2018/8/28.
//  Copyright © 2018年 石世彪. All rights reserved.
//

#import "MineViewController.h"
#import "SetViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self initNavBar];
    [self.navBar setBackgroundColor:[UIColor purpleColor]];//设置nav背景颜色
    
    [self setNavBarWithTitle:@"我的" titleColor:[UIColor whiteColor] titleFontSize:16.0f];
    [self hideNavigationBar];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor whiteColor];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)click{
    
    SetViewController *set = [[SetViewController alloc]init];
    [self.navigationController pushViewController:set animated:YES];
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
