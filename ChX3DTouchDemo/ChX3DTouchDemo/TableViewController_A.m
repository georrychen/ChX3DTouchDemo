//
//  TableViewController_A.m
//  ChX3DTouchDemo
//
//  Created by Xu Chen on 2018/8/18.
//  Copyright © 2018年 xu.yzl. All rights reserved.
//

#import "TableViewController_A.h"
#import "DetailViewController.h"

@interface TableViewController_A ()<UIViewControllerPreviewingDelegate>
/*! 预览时的选项菜单 */
@property (nonatomic, strong) NSArray *recordPreviewActionItems;

@end

@implementation TableViewController_A

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView registerClass:NSClassFromString(@"UITableViewCell") forCellReuseIdentifier:@"cellId"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",(long)indexPath.row];
    
    // 注册需要实现 Touch 效果的view， 这里是 用力按下cell,弹出预览小视图，同时上滑底部出现若干个选项（peek功能）
    // 首先判断设备系统是否支持，否则会崩溃
    if ([self respondsToSelector:@selector(traitCollection)]) {
        if ([self.traitCollection respondsToSelector:@selector(forceTouchCapability)]) {
            if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
                [self registerForPreviewingWithDelegate:self sourceView:cell];
            }
        }
    }
    
    return cell;
}

#pragma mark - UIViewControllerPreviewingDelegate

// 把当前的cell注册绑定，然后试图界面实现UIViewControllerPreviewingDelegate代理
-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    // 获取当前 cell 的 indexpath
    NSIndexPath *index = [self.tableView indexPathForCell:(UITableViewCell *)[previewingContext sourceView]];
    
    DetailViewController *detailVc = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    detailVc.name = [NSString stringWithFormat:@"我是从第%ld行来的",(long)index.row];
   
    // 设置预览视图下方菜单
    detailVc.recordPreviewActionItems = self.recordPreviewActionItems;
    
    return detailVc;
}


// 继续用力按下进入下一页（pop）
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    [self presentViewController:viewControllerToCommit animated:YES completion:nil];
}


- (NSArray *)recordPreviewActionItems {
    if (!_recordPreviewActionItems) {
        UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"删除" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
//            [self deleteCellWithIndexPath:self.previewCellIndexPath];
            NSLog(@"删除");
        }];
        UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"返回" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
            NSLog(@"预览返回");
        }];
        _recordPreviewActionItems = @[action1,action2];
    }
    return _recordPreviewActionItems;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
