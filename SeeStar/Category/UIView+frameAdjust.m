//
//  UIView+frameAdjust.m
//  core text
//
//  Created by admin on 2017/3/29.
//  Copyright © 2017年 crypond. All rights reserved.
//

#import "UIView+frameAdjust.h"
#import <UIKit/UIKit.h>

@implementation UIView (frameAdjust)

-(CGFloat)x{
    return  self.frame.origin.x;
}

-(CGFloat)y{
    return self.frame.origin.y;
}

-(CGFloat)height{
    return self.frame.size.height;
}

-(CGFloat)width{
    return self.frame.size.width;
}

-(void)setX:(CGFloat)x{
    self.frame = CGRectMake(x, self.y, self.width, self.height);
}

-(void)setY:(CGFloat)y{
    self.frame = CGRectMake(self.x, y, self.width, self.height);
}

-(void)setHeight:(CGFloat)height{
    self.frame = CGRectMake(self.x, self.y, self.width, height);
}

-(void)setWidth:(CGFloat)width{
    self.frame= CGRectMake(self.x, self.y, width, self.height);
}

@end
