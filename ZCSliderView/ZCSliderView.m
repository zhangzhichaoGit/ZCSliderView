//
//  ZCSliderView.m
//  ZCSliderView
//
//  Created by ZCMAC on 2017/3/27.
//  Copyright © 2017年 ZCMAC. All rights reserved.
//

#import "ZCSliderView.h"
#define TITLETAG 30000
@interface ZCSliderView ()

@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, assign) CGFloat wideTitle;
@end
@implementation ZCSliderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self= [super initWithFrame:frame];
    if (self) {
        [self makeSlider];
        _selectIdx = 0;
        _defaultColor = [UIColor blackColor];
        _selectColor = [UIColor redColor];
        _fontTitle = [UIFont systemFontOfSize:13];
    }
    return self;
}
- (void)setFontTitle:(UIFont *)fontTitle
{
    _fontTitle = fontTitle;
    for (NSInteger i = 0; i<_titleArr.count; i ++) {
        UILabel *title = [self viewWithTag:TITLETAG + i];
        title.font = _fontTitle;
    }
}
- (void)setSelectColor:(UIColor *)selectColor
{
    _selectColor = selectColor;
    UILabel *title  = [self viewWithTag:TITLETAG + _selectIdx];
    title.textColor = _selectColor;
}
- (void)setDefaultColor:(UIColor *)defaultColor
{
    _defaultColor = defaultColor;
    for (NSInteger i = 0; i<_titleArr.count; i ++) {
        if (i == _selectIdx) continue;
        UILabel *title = [self viewWithTag:TITLETAG + i];
        title.textColor = _defaultColor;
    }
}

- (void)setSelectIdx:(NSInteger)selectIdx
{
    _selectIdx = selectIdx;
    [self setDefaultColor:_defaultColor];
    [self setSelectColor:_selectColor];
    [_slider setValue:_selectIdx+1];
}
- (void)setWideTitle:(CGFloat)wideTitle
{
    _wideTitle = wideTitle;
    for (NSInteger i = 0 ; i < _titleArr.count; i++) {
        UILabel *titleText = [[UILabel alloc]initWithFrame:CGRectMake(- (_wideTitle/2)+5 + i *  _wideTitle, 0, _wideTitle, 30)];
        titleText.text = _titleArr[i];
        titleText.tag = TITLETAG + i;
        titleText.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleText];
    }
    [self setDefaultColor:_defaultColor];
    [self setSelectColor:_selectColor];
    [self setSelectIdx:_selectIdx];
    
}
- (void)setTitleArr:(NSArray *)titleArr
{
    _titleArr = titleArr;
    _slider.frame= CGRectMake(0, 40, self.bounds.size.width, 20);
    _slider.maximumValue = titleArr.count;
    self.wideTitle = (self.bounds.size.width - 10) / (titleArr.count - 1);
}
- (void)makeSlider
{
    //滑块设置
    _slider = [[UISlider alloc] init];
    _slider.minimumValue = 1;
    _slider.minimumTrackTintColor = [UIColor redColor];
    _slider.maximumTrackTintColor = [UIColor lightGrayColor];
    [_slider setThumbImage:[UIImage imageNamed:@"slider_btn"] forState:UIControlStateNormal];
    [_slider setValue:_selectIdx+1];

    //添加点击手势和滑块滑动事件响应
    [_slider addTarget:self
                action:@selector(sliderValueChanged:)
      forControlEvents:UIControlEventValueChanged];
    UITapGestureRecognizer *tapGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
    [_slider addGestureRecognizer:tapGesture];
    [self addSubview:_slider];
}
- (void)sliderValueChanged:(UISlider *)sender
{
    //固定间距
    NSString *tempNumberStr = [self numberFormat:sender.value];
    self.selectIdx = tempNumberStr.integerValue - 1;
    if ([self.delegate respondsToSelector:@selector(sliderView:selectDidChange:)]) {
        [self.delegate sliderView:self selectDidChange:tempNumberStr.integerValue - 1];
    }
}

- (void)tapGestureAction:(UITapGestureRecognizer *)sender
{
    //取得点击点
    CGPoint p = [sender locationInView:_slider];
    float tempFloat = (p.x - (_wideTitle/2)) / self.bounds.size.width * _titleArr.count + 1;
    NSString *tempNumberStr = [self numberFormat:tempFloat];
    self.selectIdx = tempNumberStr.integerValue - 1;
    if ([self.delegate respondsToSelector:@selector(sliderView:selectDidChange:)]) {
        [self.delegate sliderView:self selectDidChange:tempNumberStr.integerValue - 1];
    }
}

- (NSString *)numberFormat:(float)num
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setPositiveFormat:@"0"];
    return [formatter stringFromNumber:[NSNumber numberWithFloat:num]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
