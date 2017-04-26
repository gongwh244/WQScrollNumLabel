//
//  ViewController.m
//  WQScrollNumLabel
//
//  Created by gong on 2017/4/26.
//  Copyright © 2017年 gong. All rights reserved.
//

#import "ViewController.h"
#import "WQNumView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputTextField;

@end

@implementation ViewController{
    WQNumView *_view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _view = [[WQNumView alloc] initWithFrame:CGRectMake(0, 20, 20, 40)];
    [self.view addSubview:_view];
}




- (IBAction)updateAction:(id)sender {
    [_view setAnimationToValue:self.inputTextField.text.integerValue];
}

@end
