//
//  FireworksView.m
//  SeeStar
//
//  Created by Scarlett on 2017/4/7.
//  Copyright © 2017年 crypond. All rights reserved.
//

#import "FireworksView.h"

@implementation FireworksView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self performSelector:@selector(initFireworks) withObject:nil afterDelay:1];
    }
    return self;
}

-(void)initFireworks{
    
    CAEmitterLayer * firelayer                  = [CAEmitterLayer layer];
    firelayer.position                          = CGPointMake(kScreenWidth /2, kScreenHeight-50);
    firelayer.emitterSize                       = CGSizeMake(10, 0);
    firelayer.emitterMode                       = kCAEmitterLayerOutline;
    firelayer.emitterShape                      = kCAEmitterLayerLine;
    firelayer.renderMode                        = kCAEmitterLayerAdditive;
    
    //烟花
    CAEmitterCell * cell                        = [CAEmitterCell emitterCell];
    cell.birthRate                              = 1;
    cell.lifetime                               = 2.5;
    cell.lifetimeRange                          = 0.3;
    cell.velocity                               = 400;
    cell.velocityRange                          = 110;
    cell.contents                               = (id)[UIImage imageNamed:@"FFTspark"].CGImage;
    cell.color                                  = [UIColor colorWithRed:0.8 green:0.6 blue:0.6 alpha:1].CGColor;
    cell.redRange                               = 1;
    cell.greenRange                             = 0.4;
    cell.blueRange                              = 0.4;
    cell.scale                                  = 0.2;
    cell.scaleRange                             = 0.1;
    //发射角度范围
    cell.emissionRange                          = M_PI /6;
    cell.spinRange                              = M_PI;
    cell.yAcceleration                          = 50;
    
    // 爆炸
    CAEmitterCell *burst            = [CAEmitterCell emitterCell];
    // 粒子产生系数
    burst.birthRate                 = 2.0;
    // 速度
    burst.velocity                  = 0;
    // 缩放比例
    burst.scale                     = 1.5;
    // shifting粒子red在生命周期内的改变速度
    burst.redSpeed                  = -1.5;
    // shifting粒子blue在生命周期内的改变速度
    burst.blueSpeed                 = +1.5;
    // shifting粒子green在生命周期内的改变速度
    burst.greenSpeed                = +1.0;
    //生命周期
    burst.lifetime                  = 0.35;
    
    
    //火花
    CAEmitterCell * fire                        = [CAEmitterCell emitterCell];
    //
    fire.birthRate                              = 400;
    //
    fire.velocity                               = 70;
    //spark.lifetime                            = 1.5;
    fire.lifetime                               = 1.5;
    
    fire.contents                               = (id)[[UIImage imageNamed:@"FFTspark"] CGImage];
    //
    fire.scaleSpeed                             = -0.1;
    //
    fire.greenSpeed                             = -0.05;
    //
    fire.redSpeed                               = 0.2;
    //
    fire.blueSpeed                              = -0.05;
    //
    fire.alphaSpeed                             = -0.18;
    //
    fire.spin                                   = 2* M_PI;
    //
    fire.spinRange                              = 2* M_PI;
    //发射角度（不可少的属性）
    fire.emissionRange                          = M_PI;
    
    
    firelayer.emitterCells                      = @[cell];
    
    cell.emitterCells                           = [NSArray arrayWithObject:burst];
    burst.emitterCells                          = @[fire];
    [self.layer addSublayer:firelayer];
}


-(void)initFireDemo{
    CAEmitterLayer * caELayer                   = [CAEmitterLayer layer];
    // 发射源
    caELayer.emitterPosition   = CGPointMake(kScreenWidth / 2,kScreenHeight - 20);
    // 发射源尺寸大小
    caELayer.emitterSize       = CGSizeMake(0, 0);
    // 发射源模式
    caELayer.emitterMode       = kCAEmitterLayerOutline;
    // 发射源的形状
    caELayer.emitterShape      = kCAEmitterLayerLine;
    // 渲染模式
    caELayer.renderMode        = kCAEmitterLayerAdditive;
    // 发射方向
    //self.caELayer.velocity          = 1;
    // 随机产生粒子
    //self.caELayer.seed              = (arc4random() % 100) + 1;
    
    
    // cell
    CAEmitterCell *cell             = [CAEmitterCell emitterCell];
    // 速率
    cell.birthRate                  = 2;
    
    // 发射的角度
    cell.emissionRange              = M_PI /6;
    // 速度
    cell.velocity                   = 300;
    // 范围
    cell.velocityRange              = 150;
    // Y轴 加速度分量
    cell.yAcceleration              = 75;
    // 声明周期
    cell.lifetime                   = 2.04;
    //是个CGImageRef的对象,既粒子要展现的图片
    cell.contents                   = (id)
    [[UIImage imageNamed:@"FFTspark"] CGImage];
    // 缩放比例
    cell.scale                      = 0.05;
    // 粒子的颜色
    cell.color                      = [[UIColor colorWithRed:0.6
                                                       green:0.6
                                                        blue:0.6
                                                       alpha:1.0] CGColor];
    // 一个粒子的颜色green 能改变的范围
    cell.greenRange                 = 1.0;
    // 一个粒子的颜色red 能改变的范围
    cell.redRange                   = 1.0;
    // 一个粒子的颜色blue 能改变的范围
    cell.blueRange                  = 1.0;
    // 子旋转角度范围
    cell.spinRange                  = M_PI;
    
    
    // 爆炸
    CAEmitterCell *burst            = [CAEmitterCell emitterCell];
    // 粒子产生系数
    burst.birthRate                 = 1.0;
    // 速度
    burst.velocity                  = 0;
    // 缩放比例
    burst.scale                     = 1.5;
    // shifting粒子red在生命周期内的改变速度
    burst.redSpeed                  = -1.5;
    // shifting粒子blue在生命周期内的改变速度
    burst.blueSpeed                 = +1.5;
    // shifting粒子green在生命周期内的改变速度
    burst.greenSpeed                = +1.0;
    //生命周期
    burst.lifetime                  = 0.35;
    
    
    // 火花 and finally, the sparks
    CAEmitterCell *spark            = [CAEmitterCell emitterCell];
    //粒子产生系数，默认为1.0
    spark.birthRate                 = 400;
    //速度
    spark.velocity                  = 68;
    // 360 deg//周围发射角度
    spark.emissionRange             = M_PI;
    // gravity//y方向上的加速度分量
    //spark.yAcceleration             = 37;
    //粒子生命周期
    spark.lifetime                  = 1.5;
    //是个CGImageRef的对象,既粒子要展现的图片
    spark.contents                  = (id)
    [[UIImage imageNamed:@"FFTspark"] CGImage];
    //缩放比例速度
    
    spark.scaleSpeed                = -0.01;
    //粒子green在生命周期内的改变速度
    spark.greenSpeed                = -0.05;
    //粒子red在生命周期内的改变速度
    spark.redSpeed                  = 0.2;
    //粒子blue在生命周期内的改变速度
    spark.blueSpeed                 = -0.05;
    //粒子透明度在生命周期内的改变速度
    spark.alphaSpeed                = -0.18;
    //子旋转角度
    spark.spin                      = 2* M_PI;
    //子旋转角度范围
    spark.spinRange                 = 2* M_PI;
    
    
    caELayer.emitterCells = @[cell];
    
    cell.emitterCells = [NSArray arrayWithObjects:burst, nil];
    burst.emitterCells = [NSArray arrayWithObject:spark];
    [self.layer addSublayer:caELayer];
    
}

@end
