//
//  FindViewController.m
//  InPhoto
//
//  Created by shishi on 2018/8/28.
//  Copyright © 2018年 石世彪. All rights reserved.
//

#import "FindViewController.h"

@interface FindViewController ()

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initNavBar];
    [self.navBar setBackgroundColor:[UIColor greenColor]];//设置nav背景颜色
    
    [self setNavBarWithTitle:@"发现" titleColor:[UIColor whiteColor] titleFontSize:16.0f];
//    [self hideNavigationBar];
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
