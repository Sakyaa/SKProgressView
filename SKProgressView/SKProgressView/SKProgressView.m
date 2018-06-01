//
//  SKProgressView.m
//  SKProgressView
//
//  Created by Sakya on 2018/6/1.
//  Copyright © 2018年 Sakya. All rights reserved.
//

#import "SKProgressView.h"
#import "SKProgressFullCircleView.h"

@implementation SKProgressViewConfiguration

static SKProgressViewConfiguration *defaultConfiguration;
+ (void)setDefaultConfiguration:(SKProgressViewConfiguration *)configuration {
    if (defaultConfiguration) { //只允许设置一次，有值的时候返回
        return;
    }
    defaultConfiguration = [configuration copy]; // 通过拷贝对象，避免配置项后面被修改
}
- (id)copyWithZone:(nullable NSZone *)zone {
    return self;
}
+ (instancetype)defaultConfiguration {
    NSAssert(defaultConfiguration, @"未设置 defaultConfiguration，应先调用 +[SKProgressViewConfiguration setDefaultConfiguration:] 来进行初始化");
    return defaultConfiguration;
}

@end

@interface SKProgressView ()
/**
 显示进度的View
 */
@property (nonatomic, strong) UIView *topView;
@end
@implementation SKProgressView

- (instancetype)initWithFrame:(CGRect)frame
                      addView:(UIView *)view {
    if (self = [super initWithFrame:frame]) {
        SKProgressViewConfiguration *config= SKProgressViewConfiguration.defaultConfiguration;
        _strokeWidth = config.strokeWidth;
        _progressColor = config.progressColor;
        _trackColor = config.trackColor;
        _superView = view;
        _progress = 0.0f;
    }
    return self;
}
- (void)_initProgressView {
    switch (_progressStyle) {
        case SKProgressViewFullCircleStyle:
            [self _initFullCircleView];
            break;
        case SKProgressViewGapCircleStyle:
            
            break;
        case SKProgressViewNormalLineStyle:
            
            break;
            
        default:
            break;
    }
}
- (void)_initFullCircleView {
    SKProgressFullCircleView *fullCircleView = [[SKProgressFullCircleView alloc] initWithFrame:self.bounds];
    //设置属性
    fullCircleView.strokeWidth = _strokeWidth;
    fullCircleView.trackColor = _trackColor;
    fullCircleView.progressColor = _progressColor;
    _topView = fullCircleView;
}
- (void)_initGapCircleView {
    
}
- (void)_initNormalLineView {
    
}
#pragma mark --
#pragma mark --show hide remove
- (void)sk_show {
    if (!_topView) {
        
        self.hidden = NO;
    }
    self.hidden = NO;
}
- (void)sk_hide {
    self.hidden = YES;
}

@end
