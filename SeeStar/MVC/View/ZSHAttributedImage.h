//
//  ZSHAttributedImage.h
//  core text
//
//  Created by admin on 2017/3/29.
//  Copyright © 2017年 crypond. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZSHImageType) {
    ZSHPNGJPNGType = 0,
    ZSHGifType,
    ZSHURLType
};

@interface ZSHAttributedImage : NSObject

/**
 * 图片名字
 */
@property (nonatomic, copy) NSString *imageName;

/**
 * 图片大小
 */
@property (nonatomic, assign) CGSize imageSize;

/**
 * 图片的位置
 */
@property (nonatomic, assign) NSInteger position;

/**
 * 图片类型
 */
@property (nonatomic, assign) ZSHImageType imageType;

/**
 * 占位图片属性字符的字体fontRef
 * ->此处为方便计算Ascent和Descent
 */
@property (nonatomic, assign) CTFontRef fontRef;

/**
 * 图片与文字的上下左右的间距
 */
@property (nonatomic, assign) UIEdgeInsets imageInsets;
@end
