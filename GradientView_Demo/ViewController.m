//
//  ViewController.m
//  GradientView_Demo
//
//  Created by admin on 16/8/5.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "ViewController.h"
#import "GradientLabel.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSArray *gradientColors = @[(id)[UIColor redColor].CGColor, (id)[UIColor greenColor].CGColor];
    
    //view
    [self addGradientView];

    
    
    // label
//    [self addGradientLabelWithColors:gradientColors];
    
    // layer
//    [self addGradientLayerWithColors:gradientColors];
    
    
    
}
//http://www.jianshu.com/p/c780bbd14091
- (void)addGradientView
{
    UIView* testView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 150)];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    
    //  设置 gradientLayer 的 Frame
    gradientLayer.frame = testView.bounds;
    
    //  创建渐变色数组，需要转换为CGColor颜色
//    gradientLayer.colors = @[(id)[UIColor redColor].CGColor,
//                             (id)[UIColor yellowColor].CGColor,
//                             (id)[UIColor blueColor].CGColor];
    gradientLayer.colors = @[(id)[UIColor redColor].CGColor,
                             (id)[UIColor greenColor].CGColor];
    
    
//    //  设置三种颜色变化点，取值范围 0.0~1.0
//    gradientLayer.locations = @[@(0.1f) ,@(0.4f)];
    
    gradientLayer.locations = @[@(0.4f)];
    
    
    //  设置渐变颜色方向，左上点为(0,0), 右下点为(1,1)
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    
    //  添加渐变色到创建的 UIView 上去
    [testView.layer addSublayer:gradientLayer];
    
    [self.view addSubview:testView];

}





























- (void)addGradientLabelWithColors:(NSArray *)colors
{
    GradientLabel* testLabel = [[GradientLabel alloc] init];
    testLabel.text = @"我是渐变色的呀呀呀呀--label";
    testLabel.font = [UIFont systemFontOfSize:23];
    [testLabel sizeToFit];
    testLabel.colors = colors;
    
    [self.view addSubview:testLabel];
    testLabel.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.5);
}

- (void)addGradientLayerWithColors:(NSArray *)colors
{
    UILabel* testLabel = [[UILabel alloc] init];
    testLabel.text = @"我是渐变色的呀呀呀呀--layer";
    testLabel.font = [UIFont systemFontOfSize:23];
    [testLabel sizeToFit];
    
    [self.view addSubview:testLabel];
    testLabel.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.7);
    
    // 创建渐变层
    CAGradientLayer* gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = testLabel.frame;
    gradientLayer.colors = colors;
    gradientLayer.startPoint = CGPointMake(0, 1);
    gradientLayer.endPoint = CGPointMake(1, 1);
    [self.view.layer addSublayer:gradientLayer];
    
    gradientLayer.mask = testLabel.layer;
    testLabel.frame = gradientLayer.bounds;
}


@end
