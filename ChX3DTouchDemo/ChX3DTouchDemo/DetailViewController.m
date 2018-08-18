//
//  DetailViewController.m
//  ChX3DTouchDemo
//
//  Created by Xu Chen on 2018/8/18.
//  Copyright © 2018年 xu.yzl. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titleLabel.text = self.name;

}

#pragma mark - ****************  3D Touch 预览时下方快捷菜单
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    return  self.recordPreviewActionItems;
}


@end
