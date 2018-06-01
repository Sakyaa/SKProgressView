//
//  SKProgressFullCircleView.h
//  SKProgressView
//
//  Created by Sakya on 2018/6/1.
//  Copyright © 2018年 Sakya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKProgressFullCircleView : UIView

@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign) CGFloat strokeWidth;
/**
 进度条颜色
 */
@property (nonatomic, strong) UIColor *progressColor;
/**
 进度条颜色
 */
@property (nonatomic, strong) UIColor *trackColor;
/**
 进度条顶部
 */
@property (nonatomic, copy) NSString *lineCap;


@end
