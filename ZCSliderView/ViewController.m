//
//  ViewController.m
//  ZCSliderView
//
//  Created by ZCMAC on 2017/3/27.
//  Copyright © 2017年 ZCMAC. All rights reserved.
//

#import "ViewController.h"
#import "ZCSliderView.h"
@interface ViewController ()<ZCSliderViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZCSliderView *zcslider = [[ZCSliderView alloc]initWithFrame:CGRectMake(100, 100, self.view.bounds.size.width - 200, 70)];
    
    zcslider.selectIdx = 2;
    zcslider.fontTitle = [UIFont systemFontOfSize:16];
    zcslider.titleArr = @[@"小",@"标准",@"中",@"大",@"特大"];
    zcslider.selectColor = [UIColor yellowColor];
    zcslider.defaultColor = [UIColor redColor];
    zcslider.delegate = self;
    
    [self.view addSubview:zcslider];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)sliderView:(ZCSliderView *)sliderView selectDidChange:(NSInteger)idx
{
    NSLog(@"%ld",(long)idx);
}
    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
