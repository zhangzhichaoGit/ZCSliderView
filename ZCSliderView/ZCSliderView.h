//
//  ZCSliderView.h
//  ZCSliderView
//
//  Created by ZCMAC on 2017/3/27.
//  Copyright © 2017年 ZCMAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZCSliderView;
@protocol ZCSliderViewDelegate <NSObject>

- (void)sliderView:(ZCSliderView *)sliderView selectDidChange:(NSInteger)idx;

@end
@interface ZCSliderView : UIView

@property(nonatomic,assign)id<ZCSliderViewDelegate> delegate;

/**文字标题*/
@property(nonatomic,strong)NSArray *titleArr;

/**选择的位置*/
@property(nonatomic,assign)NSInteger selectIdx;

/**默认选择色*/
@property(nonatomic,strong)UIColor *defaultColor;

/**选中颜色*/
@property(nonatomic,strong)UIColor *selectColor;

/**字体大小*/
@property(nonatomic,strong)UIFont *fontTitle;
@end
