//
//  SKProgressFullCircleView.m
//  SKProgressView
//
//  Created by Sakya on 2018/6/1.
//  Copyright © 2018年 Sakya. All rights reserved.
//

#import "SKProgressFullCircleView.h"
#import "NSTimer+sk_blockSupport.h"


@interface SKProgressFullCircleView () {
    
    CAShapeLayer *backgroundLayer; //背景图层
    CAShapeLayer *frontFillLayer;//用来填充的图层
    
    UIBezierPath *backgroundPath;//背景贝赛尔曲线
    UIBezierPath *frontFillPath;//用来填充的贝赛尔曲线
    
    NSTimer * timer;//定时器用作动画
    CGPoint center;//中心点
}
@end
@implementation SKProgressFullCircleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _progressColor = [UIColor whiteColor];
        _trackColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
        
        //创建背景图层
        backgroundLayer = [CAShapeLayer layer];
        backgroundLayer.fillColor = nil;
        backgroundLayer.frame = self.bounds;
        
        //创建填充图层
        frontFillLayer = [CAShapeLayer layer];
        frontFillLayer.fillColor = nil;
        frontFillLayer.frame = self.bounds;

        frontFillLayer.strokeColor = _progressColor.CGColor;
        backgroundLayer.strokeColor = _trackColor.CGColor;
        
        center = CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)/2);
        backgroundPath = [UIBezierPath bezierPathWithArcCenter:center radius:(CGRectGetWidth(self.bounds)-_strokeWidth)/2.f startAngle:0 endAngle:M_PI*2 clockwise:YES];
        backgroundLayer.path = backgroundPath.CGPath;
        
        frontFillLayer.lineWidth = _strokeWidth;
        backgroundLayer.lineWidth = _strokeWidth;
        
        [self.layer addSublayer:backgroundLayer];
        [self.layer addSublayer:frontFillLayer];
    }
    
    return self;
}
#pragma mark --setter
- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    if (timer) {
        [timer invalidate];
        timer = nil;
    }
    __weak typeof(self) wSelf = self;
    __block double progressValue = 0.0;
    timer = [NSTimer sk_scheduledTimerWithTimeInterval:0.01 block:^{
        if (progressValue >= wSelf.progress || progress >= 1.0f) {
            if (timer) {
                [timer invalidate];
                timer = nil;
                [wSelf fillPathContent:progressValue];
            }
            return;
        } else {
            [wSelf fillPathContent:progressValue];
        }
        progressValue += 0.01 * (wSelf.progress);
        
    } repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}
- (void)fillPathContent:(CGFloat)progress {
    
    frontFillPath = [UIBezierPath bezierPathWithArcCenter:center radius:(CGRectGetWidth(self.bounds)-_strokeWidth)/2.f startAngle:M_PI_2 endAngle:(2*M_PI)*progress + M_PI_2 clockwise:YES];
    frontFillLayer.path = frontFillPath.CGPath;
    frontFillLayer.lineCap = _lineCap;
}


@end
