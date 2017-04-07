//
//  NSString+Size.m
//  SeeStar
//
//  Created by Scarlett on 2017/4/7.
//  Copyright © 2017年 crypond. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

-(float)widthForString:(NSString *)value fontSize:(float)fontSize andHeight:(float)height
{
    UIColor  *backgroundColor=[UIColor whiteColor];
    UIFont *font=[UIFont boldSystemFontOfSize:fontSize];
    CGRect sizeToFit = [value boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{
                                                                                                                                              NSForegroundColorAttributeName:backgroundColor,
                                                                                                                                              NSFontAttributeName:font,
                                                                                                                                              
                                                                                                                                              } context:nil];
    
    return sizeToFit.size.width+50;
}

@end
