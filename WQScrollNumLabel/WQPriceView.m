//
//  WQPriceView.m
//  WQScrollNumLabel
//
//  Created by gong on 2017/4/27.
//  Copyright © 2017年 gong. All rights reserved.
//

#import "WQPriceView.h"
#import "WQNumView.h"

#define WQNUMVIEW_WIDTH                 10

typedef NS_ENUM(NSInteger,StringType){
    StringTypeNum,
    StringTypePot,
    StringTypeComma,
    StringTypeSymbol
};

@interface WQPriceView ()

@property (nonatomic,assign) CGRect labelFrame;

@property (nonatomic,strong) NSMutableArray<WQNumView *> *viewArr;

@property (nonatomic,assign) NSInteger addPlace;
@property (nonatomic,assign) NSInteger beforePlace;
@property (nonatomic,assign) NSInteger afterPlace;

@end

@implementation WQPriceView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.labelFrame = CGRectMake(0, 0, frame.size.height * 0.5, frame.size.height);
        self.backgroundColor = [UIColor redColor];
        
        [self initData];
    }
    return self;
}

- (void)initData{
    
    self.money = 0.00f;
    self.moneyType = MoneyTypeAmerican;
    
    self.viewArr = [[NSMutableArray alloc] init];
    
    
    NSString *showString = [self stringWithMoney:self.money moneyType:self.moneyType];
    
    
    NSLog(@"str = %@",showString);
    
    [self layoutLabelsWith:showString];
    
    self.beforePlace = showString.length;
    self.beforePlace = showString.length;
}

- (void)layoutLabelsWith:(NSString *)str{
    
    NSInteger count = str.length;
    NSInteger startX = self.frame.size.width - WQNUMVIEW_WIDTH * count;
    
    for (int i = 0; i < count; i++) {
        
        NSString *character = [str substringWithRange:NSMakeRange(i, 1)];
        StringType type = [self stringTypeWithString:character];
        if (type == StringTypeNum) {
            WQNumView *view = [[WQNumView alloc] initWithFrame:CGRectMake(startX + i * WQNUMVIEW_WIDTH, 0, WQNUMVIEW_WIDTH, self.frame.size.height)];
            [self addSubview:view];
            [self.viewArr addObject:view];
            
        }else{
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(startX + i * WQNUMVIEW_WIDTH, 0, WQNUMVIEW_WIDTH, self.frame.size.height)];
            [self addSubview:label];
            label.textAlignment = NSTextAlignmentCenter;
            label.backgroundColor = [UIColor yellowColor];
            label.text = character;
        }
    }
}

- (void)setAnimationToValue:(float)toValue{
    
    
    
    
    
    
    
    NSString *str = [self stringWithMoney:toValue moneyType:self.moneyType];
    self.afterPlace = str.length;
    
    self.addPlace = self.afterPlace - self.beforePlace;
    
    NSInteger startX;
    if (self.addPlace > 0) {
        
        startX = self.frame.size.width - WQNUMVIEW_WIDTH * self.afterPlace;
        
    }
    
    
    
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < str.length; i++) {
        
        NSString *character = [str substringWithRange:NSMakeRange(i, 1)];
        StringType type = [self stringTypeWithString:character];
        if (type == StringTypeNum) {
            NSNumber *number = [NSNumber numberWithInteger:character.integerValue];
            [arr addObject:number];
        }
    }
    
    for (int i = 0; i < arr.count; i ++) {
        WQNumView *view = self.viewArr[i];
        NSNumber *num = arr[i];
        [view setAnimationToValue:num.integerValue];
    }
    
    
    
    
    
    
    
    self.beforePlace = self.afterPlace;
}




- (NSString *)stringWithMoney:(CGFloat)money moneyType:(MoneyType)type{
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.minimumFractionDigits = 2;
    formatter.maximumFractionDigits = 2;
    
    NSString *moneyStr = [formatter stringFromNumber:[NSNumber numberWithFloat:money]];
    NSString *string = [NSString stringWithFormat:@"%@%@",[self moneySymbolWith:type],moneyStr];
    return string;
}


- (NSString *)moneySymbolWith:(MoneyType)moneyType{
    NSString *symbol;
    switch (moneyType) {
        case MoneyTypeChinese:{
            symbol = @"¥";
        }
            break;
        case MoneyTypeAmerican:{
            symbol = @"$";
        }
            break;
        default:{
            symbol = @"¥";
        }
            break;
    }
    return symbol;
}

- (StringType)stringTypeWithString:(NSString *)str{
    
    NSString *string = [str stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if (string.length == 0) {
        return StringTypeNum;
    }else if([str isEqualToString:@"."]){
        return StringTypePot;
    }else if ([str isEqualToString:@","]){
        return StringTypeComma;
    }else{
        return StringTypeSymbol;
    }
}










@end
