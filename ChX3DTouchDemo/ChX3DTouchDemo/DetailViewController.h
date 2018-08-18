//
//  DetailViewController.h
//  ChX3DTouchDemo
//
//  Created by Xu Chen on 2018/8/18.
//  Copyright © 2018年 xu.yzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSArray *recordPreviewActionItems;

@end
