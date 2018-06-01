//
//  ViewController.m
//  SKProgressView
//
//  Created by Sakya on 2018/5/31.
//  Copyright © 2018年 Sakya. All rights reserved.
//

#import "ViewController.h"
#import "SKProgressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SKProgressViewConfiguration *configuartion = [SKProgressViewConfiguration new];
    configuartion.strokeWidth = 5.0f;
    configuartion.progressColor = [UIColor redColor];
    configuartion.trackColor = [UIColor lightTextColor];
    SKProgressViewConfiguration.defaultConfiguration = configuartion;
    
    SKProgressView *progressView = [[SKProgressView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2 - 75, 200, 150, 150)];
    [self.view addSubview:progressView];
    progressView.progress = 0.6;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
