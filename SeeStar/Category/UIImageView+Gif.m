//
//  UIImageView+Gif.m
//  SeeStar
//
//  Created by Scarlett on 2017/4/7.
//  Copyright © 2017年 crypond. All rights reserved.
//

#import "UIImageView+Gif.h"

@implementation UIImageView (Gif)
+(UIImageView *)imageViewWithGifName:(NSString *)imageName frame:(CGRect)frame{
    UIImageView *imageView= [[UIImageView alloc] initWithFrame:frame];
    
    //    使用ImageIO库中的CGImageSource获取数据源
    //    CGImageSourceGetCount获取GIF图片的数量，并计算出每一张图显示的时间
    //    写入一个新的UIImage对象中，并返回给UIImageView
    
    NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
    
    NSData *gifData = [NSData dataWithContentsOfFile:path];//获取git的二进制数据
    
    //图片源引用
    CGImageSourceRef src = CGImageSourceCreateWithData((__bridge CFDataRef)gifData, NULL);
    
    NSMutableArray *frames = nil;//gif动画图片数组
    
    CGFloat animationTime = 0.f;//时间
    
    if (src) {
        size_t count = CGImageSourceGetCount(src);//获取图片的帧数
        
        frames = [NSMutableArray arrayWithCapacity:count];
        
        for (size_t i = 0; i < count; i++) {
            //获取指定帧图像
            CGImageRef image = CGImageSourceCreateImageAtIndex(src, i, NULL);
            
            if (image) {
                [frames addObject:[UIImage imageWithCGImage:image]];
                CGImageRelease(image);
            }
            
            //获取Gif动画时长
            NSDictionary *properties = (__bridge NSDictionary *)CGImageSourceCopyPropertiesAtIndex(src, i, NULL);
            NSDictionary *frameProperties = [properties objectForKey:(NSString *)kCGImagePropertyGIFDictionary];
            NSNumber *delayTime = [frameProperties objectForKey:(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
            animationTime += [delayTime floatValue];
            
        }
        CFRelease(src);
    }
    
    [imageView setImage:[frames objectAtIndex:0]];
    [imageView setBackgroundColor:[UIColor clearColor]];
    [imageView setAnimationImages:frames];
    [imageView setAnimationDuration:animationTime];
    [imageView startAnimating];
    
    return imageView;
}

@end

@implementation NSString(imageType)

+ (ZSHImageType)contentTypeForImageName:(NSString *)imageName{
    NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
    NSData *gifData = [NSData dataWithContentsOfFile:path];//获取二进制数据
    
    //定义一个无符号字符
    uint8_t c;
    [gifData getBytes:&c length:1];
    
    // 根据16进制图片的头部，判断图片是什么类型
    switch (c) {
        case 0x47:
            return ZSHGifType;
            break;
            
        default:
            return ZSHPNGJPNGType;
            break;
    }
}

@end

