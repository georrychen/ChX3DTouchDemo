//
//  ViewController.m
//  ChX3DTouchDemo
//
//  Created by Xu Chen on 2018/8/11.
//  Copyright © 2018年 xu.yzl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIViewController *nextVC = [[NSClassFromString(@"TableViewController_A") alloc] init];
    [self presentViewController:nextVC animated:YES completion:nil];
}

@end
