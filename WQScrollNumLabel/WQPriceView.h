//
//  WQPriceView.h
//  WQScrollNumLabel
//
//  Created by gong on 2017/4/27.
//  Copyright © 2017年 gong. All rights reserved.
//




#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,MoneyType){
    MoneyTypeChinese,
    MoneyTypeAmerican
};


@interface WQPriceView : UIView

@property (nonatomic,assign) float money;

@property (nonatomic,assign) MoneyType moneyType;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)setAnimationToValue:(float)toValue;


@end
