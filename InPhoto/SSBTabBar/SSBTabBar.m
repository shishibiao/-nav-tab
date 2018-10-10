//
//  SSBTabBar.m
//  InPhoto
//
//  Created by shishi on 2018/8/28.
//  Copyright © 2018年 石世彪. All rights reserved.
//

#import "SSBTabBar.h"

@interface SSBTabBar() {
    UIView *selectedView;
    CGFloat _itemWidth;
}

@end

@implementation SSBTabBar

-(id)initWithFrame:(CGRect)frame buttonImages:(NSArray *)imageArray{
    
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        
        UIView *line =[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 1)];
        line.backgroundColor = [UIColor yellowColor];
        [self addSubview:line];
        
        UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0.5, self.width, self.height-0.5)];
        [backgroundView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:backgroundView];
        
        self.buttons = [NSMutableArray arrayWithCapacity:[imageArray count]];
        UIButton *btn;
        _itemWidth = SCREEN_WIDTH / [imageArray count];
        
        selectedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _itemWidth, self.height)];
        [selectedView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:selectedView];
        
        for (int i = 0; i < [imageArray count]; i++)
        {
            btn = [UIButton buttonWithType:UIButtonTypeCustom];
//            btn.showsTouchWhenHighlighted = YES;
            btn.tag = i;
            btn.frame = CGRectMake(_itemWidth * i, 0, _itemWidth, frame.size.height);
            UIImage *imgNormal = [UIImage imageNamed:[[imageArray objectAtIndex:i] objectForKey:@"Normal"]];
            UIImage *imgHighlighted = [UIImage imageNamed:[[imageArray objectAtIndex:i] objectForKey:@"Highlighted"]];
            UIImage *imgSelect = [UIImage imageNamed:[[imageArray objectAtIndex:i] objectForKey:@"Selected"]];
            
            
            [btn setImage:imgNormal forState:UIControlStateNormal];
            [btn setImage:imgSelect forState:UIControlStateSelected];
            [btn setImage:imgHighlighted forState:UIControlStateHighlighted];
            
            [btn addTarget:self action:@selector(tabBarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//            [btn set_acceptEventInterrval:3.0];
            [self.buttons addObject:btn];
            [self addSubview:btn];
        }
        
    }
    return self;
}
- (void)setBackgroundImage:(UIImage *)img
{
    [_backgroundView setImage:img];
}

- (void)tabBarButtonClicked:(id)sender {
    UIButton *btn = sender;
    [self selectTabAtIndex:btn.tag];
    //    NSLog(@"Select index: %d",btn.tag);
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectIndex:)])
    {
        [_delegate tabBar:self didSelectIndex:btn.tag];
    }
}

- (void)setSelectIndex:(int)selectIndex
{
    [self selectTabAtIndex:selectIndex];
}

- (void)selectTabAtIndex:(NSInteger)index {
    [self selectTabAtIndex:index animated:YES];
}

- (void)selectTabAtIndex:(NSInteger)index animated:(BOOL)animated {
    
    for (int i = 0; i < [self.buttons count]; i++)
    {
        UIButton *b = [self.buttons objectAtIndex:i];
        b.selected = NO;
        b.userInteractionEnabled = YES;
    }
    UIButton *btn = [self.buttons objectAtIndex:index];
    btn.selected = YES;
    
    if (animated) {
        [UIView animateWithDuration:0.15
                         animations:^{
                             btn.transform = CGAffineTransformMakeScale(0.8, 0.8);
                         } completion:^(BOOL finished) {
                             [UIView animateWithDuration:0.15
                                              animations:^{
                                                  btn.transform = CGAffineTransformMakeScale(1, 1);
                                              }];
                         }];
        
        [UIView animateWithDuration:0.3
                         animations:^{
                             selectedView.left = index*_itemWidth;
                         }];
    } else  {
        selectedView.left = index*_itemWidth;
    }
    
}

- (void)enableButtonItemAtIndex:(NSInteger)index {
    if (index >= [self.buttons count]) {
        return;
    }
    
    UIButton *btn = [self.buttons objectAtIndex:index];
    btn.userInteractionEnabled = YES;
}

@end
