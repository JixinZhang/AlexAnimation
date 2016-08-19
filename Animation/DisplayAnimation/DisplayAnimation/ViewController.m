//
//  ViewController.m
//  Animation
//
//  Created by WSCN on 8/19/16.
//  Copyright © 2016 JixinZhang. All rights reserved.
//

#import "ViewController.h"

#define screenWidth [[UIScreen mainScreen] bounds].size.width
#define screenHeight [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()

@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UIView *layerView;
@property (nonatomic, strong) CALayer *colorLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame = CGRectMake(20, 350, 250, 40);
    self.btn.backgroundColor = [UIColor brownColor];
    self.btn.layer.cornerRadius = 5.0f;
    self.btn.layer.masksToBounds = YES;
    [self.btn setTitle:@"Change Color" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    
    self.layerView = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 250, 250)];
    self.layerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.layerView];
    
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake((250-100)/2.0, (250-100)/2.0, 100, 100);
    self.colorLayer.backgroundColor = [UIColor blackColor].CGColor;
    [self.layerView.layer addSublayer:self.colorLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeColor:(UIButton *)render {
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.fromValue = (__bridge id)self.colorLayer.backgroundColor;
    self.colorLayer.backgroundColor = color.CGColor;
    animation.toValue = (__bridge id)color.CGColor;
    
    [self.colorLayer addAnimation:animation forKey:nil];
}

@end
