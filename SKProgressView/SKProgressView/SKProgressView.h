//
//  SKProgressView.h
//  SKProgressView
//
//  Created by Sakya on 2018/6/1.
//  Copyright © 2018年 Sakya. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, SKProgressViewStyle) {
    SKProgressViewFullCircleStyle = 0,
    SKProgressViewGapCircleStyle = 1,
    SKProgressViewNormalLineStyle = 2
};


//只能配置一种情况
@interface SKProgressViewConfiguration : NSObject <NSCopying> // 配置类实现了深拷贝
@property (nonatomic, assign) CGFloat strokeWidth;
@property (nonatomic, strong) UIColor *progressColor;
@property (nonatomic, strong) UIColor *trackColor;
// 默认的配置项
@property (class, nonatomic) SKProgressViewConfiguration *defaultConfiguration;

@end

@interface SKProgressView : UIView

#pragma mark -- variables
/**
 进度风格
 */
@property (nonatomic, assign) SKProgressViewStyle progressStyle;
/**
 添加的父类的View
 */
@property (nonatomic, strong) UIView *superView;

/**
进度宽度
 */
@property (nonatomic, assign) CGFloat strokeWidth;
/**
 进度
 */
@property (nonatomic, assign) CGFloat progress;
/**
 进度条颜色
 */
@property (nonatomic, strong) UIColor *progressColor;
/**
 进度条轨迹颜色
 */
@property (nonatomic, strong) UIColor *trackColor;



- (void)sk_show;
- (void)sk_hide;

@end
