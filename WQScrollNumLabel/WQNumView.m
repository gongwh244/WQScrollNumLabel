//
//  WQNumView.m
//  WQScrollNumLabel
//
//  Created by gong on 2017/4/26.
//  Copyright © 2017年 gong. All rights reserved.
//

#import "WQNumView.h"
#import <CoreText/CoreText.h>

@interface WQNumView ()<CAAnimationDelegate>

@property (nonatomic,strong) CALayer *backLayer;

@end

@implementation WQNumView{
    CGPoint _oriPoint;
    NSInteger _num;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        self.layer.masksToBounds = YES;
        [self.layer addSublayer:self.backLayer];
        [self addTextLayer];
    }
    return self;
}

- (void)setAnimationToValue:(NSInteger)num{
    
    _oriPoint = self.backLayer.position;
    _num = num;
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.delegate = self;
    animation.keyPath = @"position.y";
    animation.fromValue = @(_oriPoint.y);
    animation.toValue = @(self.bounds.size.height * (5-num));
    animation.duration = 0.4;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.backLayer addAnimation:animation forKey:@"basic"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if ([anim isEqual:[self.backLayer animationForKey:@"basic"]]) {
        [self.backLayer setPosition:CGPointMake(_oriPoint.x, self.bounds.size.height * (5-_num))];
    }
}

- (CALayer *)backLayer{
    
    if (!_backLayer) {
        _backLayer = [CALayer layer];
        _backLayer.frame = CGRectMake(0, 0, self.bounds.size.width,self.bounds.size.height * 10);
        _backLayer.backgroundColor = [UIColor yellowColor].CGColor;
    }
    return _backLayer;
}


- (void)addTextLayer{
    
    NSArray *numArr = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    
    for (int i = 0; i < numArr.count; i ++) {
        
        CATextLayer *layer = [CATextLayer layer];
        layer.frame = CGRectMake(0, i * self.bounds.size.height, self.bounds.size.width, self.bounds.size.height);
        layer.contentsScale = [UIScreen mainScreen].scale;
        [self.backLayer addSublayer:layer];
        
        layer.string = numArr[i];
        layer.foregroundColor = [UIColor redColor].CGColor;
        layer.alignmentMode = kCAAlignmentCenter;
        layer.fontSize = 18;
    }
}











































@end
