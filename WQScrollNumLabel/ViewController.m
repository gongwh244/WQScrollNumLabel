//
//  ViewController.m
//  WQScrollNumLabel
//
//  Created by gong on 2017/4/26.
//  Copyright © 2017年 gong. All rights reserved.
//

#import "ViewController.h"
#import "WQNumView.h"

#import "WQPriceView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

@property (nonatomic,strong) WQPriceView *priceView;

@end

@implementation ViewController{
    WQNumView *_view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _view = [[WQNumView alloc] initWithFrame:CGRectMake(0, 20, 10, 40)];
    [self.view addSubview:_view];
    
    [self.view addSubview:self.priceView];
}

- (WQPriceView *)priceView{
    if (!_priceView) {
        _priceView = [[WQPriceView alloc] initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 40)];
    }
    return _priceView;
}


- (IBAction)updateAction:(id)sender {
    [_view setAnimationToValue:self.inputTextField.text.integerValue];
    
    [self.priceView setAnimationToValue:1.55f];
}

@end
