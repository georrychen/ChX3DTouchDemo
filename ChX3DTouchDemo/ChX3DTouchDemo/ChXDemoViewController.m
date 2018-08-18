//
//  ChXDemoViewController.m
//  ChX3DTouchDemo
//
//  Created by Xu Chen on 2018/8/11.
//  Copyright © 2018年 xu.yzl. All rights reserved.
//

#import "ChXDemoViewController.h"

@interface ChXDemoViewController ()

@end

@implementation ChXDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 250, 100)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.center = self.view.center;
    titleLabel.text = self.titleName;
    [self.view addSubview:titleLabel];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
