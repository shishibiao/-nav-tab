//
//  SetViewController.m
//  InPhoto
//
//  Created by shishi on 2018/8/28.
//  Copyright © 2018年 石世彪. All rights reserved.
//

#import "SetViewController.h"

@interface SetViewController ()

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initNavBar];
    [self.navBar setBackgroundColor:[UIColor purpleColor]];//设置nav背景颜色
    [self setBackUpBtnStayle:SSBNaviBackBtnWhiteStayle];
    [self setRightBtnStayle:SSBNaviRightBtnDefault];
    [self setNavBarWithTitle:@"设置" titleColor:[UIColor whiteColor] titleFontSize:16.0f];
    // Do any additional setup after loading the view.
}

- (void)rightBtnClick:(UIButton *)sender{
    NSLog(@"123");
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
