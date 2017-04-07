//
//  StarRainViewController.m
//  SeeStar
//
//  Created by Scarlett on 2017/4/7.
//  Copyright © 2017年 crypond. All rights reserved.
//


#import "StarRainViewController.h"
#import "UIImageView+Gif.h"
#import "FireworksView.h"
#import "NSString+Size.h"
@interface StarRainViewController ()

@end

@implementation StarRainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    //gif动图
    UIImageView *gifImageView = [UIImageView imageViewWithGifName:@"grass.gif" frame:CGRectMake(0, kScreenHeight-300, kScreenWidth, 300)];
    [self.view addSubview:gifImageView];
    
    //烟花
    FireworksView *fireView = [[FireworksView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self.view addSubview:fireView];
    
    //浮动文字
    NSArray *titles = @[@"芙蓉花又栖满了枝头",@"奈何蝶难留",@"漂泊如江水向东流",@"望断门前隔岸的杨柳",@"寂寞仍不休",@"我无言却眼泪长流"];
    
    for (NSInteger i = 0; i < titles.count; i++) {
        [self danmu:titles[i] atIndex:i];
    }
}

- (void)danmu:(NSString *)title atIndex:(NSInteger)index{
    CGFloat contentW = [title widthForString:title fontSize:17.0 andHeight:50];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth, 100+(50*index),contentW, 50)];
    label.textColor = [UIColor whiteColor];
    label.text = title;
    [self.view addSubview:label];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowBlurRadius = 5;//模糊度；
    shadow.shadowColor = [UIColor cyanColor];
    shadow.shadowOffset = CGSizeMake(1, 3);
    
    NSDictionary *dict = @{NSFontAttributeName : [UIFont systemFontOfSize:17.0], NSForegroundColorAttributeName: [UIColor whiteColor], NSShadowAttributeName :shadow, NSVerticalGlyphFormAttributeName: @(0)};
//    ,NSObliquenessAttributeName:@1倾斜度
    label.attributedText = [[NSAttributedString alloc] initWithString:label.text attributes:dict];
    
    [UIView animateWithDuration:5 animations:^{
        CGRect frame = label.frame;
        frame =  CGRectMake((kScreenWidth-contentW)/2+25, frame.origin.y,contentW,frame.size.height);
        label.frame = frame;
    } completion:^(BOOL finished) {
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
