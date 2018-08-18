//
//  AppDelegate.m
//  ChX3DTouchDemo
//
//  Created by Xu Chen on 2018/8/11.
//  Copyright © 2018年 xu.yzl. All rights reserved.
//

#import "AppDelegate.h"
#import "ChXDemoViewController.h"
#import "ViewController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    self.window.rootViewController = nav;

    [self configure3DTouch:application];
    
    [self.window makeKeyAndVisible];
    return YES;
}

/**
 配置 3D Touch 信息
 */
- (void)configure3DTouch:(UIApplication *)application {
    // 监测 3D Touch 是否可用
    if ([self respondsToSelector:@selector(traitCollection)]) {
        if ([self.window.traitCollection respondsToSelector:@selector(forceTouchCapability)]) {
            if (self.window.traitCollection.forceTouchCapability != UIForceTouchCapabilityAvailable) {
                return;
            }
        }
    }
    
    /*
     第一种静态创建方式： 通过 Plist 文件静态设置, 使用不是很方便，不推荐使用
     plist 文件中需添加下面这段：
         <array>
             <dict>
                 <key>UIApplicationShortcutItemIconType</key>
                 <string>UIApplicationShortcutIconTypeSearch</string>
                     <key>UIApplicationShortcutItemTitle</key>
                     <string>搜索</string>
                 <key>UIApplicationShortcutItemSubTitle</key>
                 <string>点击进入搜索课程、文章</string>
                     <key>UIApplicationShortcutItemType</key>
                     <string>com.268.search</string>
             </dict>
         </array>
     */
    
    /*
     第二种动态创建方法： 通过代码动态创建，UIApplicationShortcutItem
     自定义图标大小推荐： 35*35
     */
    
    // 0. 搜索
    UIApplicationShortcutIcon *searchIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch];
    UIApplicationShortcutItem *searceItem = [[UIApplicationShortcutItem alloc]
                                             initWithType:@"com.268.search"
                                             localizedTitle:@"搜索"
                                             localizedSubtitle:nil
                                             icon:searchIcon
                                             userInfo:nil];
    
    
    // 1. 查看系统消息
    UIApplicationShortcutIcon *messageIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeMessage];
    UIApplicationShortcutItem *messageItem = [[UIApplicationShortcutItem alloc] initWithType:@"com.268.message" localizedTitle:@"消息" localizedSubtitle:@"点击进入系统消息" icon:messageIcon userInfo:nil];
    
    // 2. 我的课程
    UIApplicationShortcutIcon *courseIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeBookmark];
    UIApplicationShortcutItem *courseItem = [[UIApplicationShortcutItem alloc] initWithType:@"com.268.course" localizedTitle:@"课程" localizedSubtitle:@"点击进入我的课程" icon:courseIcon userInfo:nil];
    
    // 2. 我的直播
    // 这里可以自定义图标，不使用系统的 icon, 推荐尺寸是 35*35，单色（因为系统会把图片渲染成灰黑色）
    UIApplicationShortcutIcon *livingIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"我的_我的直播"];
    
    UIApplicationShortcutItem *livingItem = [[UIApplicationShortcutItem alloc] initWithType:@"com.268.living" localizedTitle:@"直播" localizedSubtitle:@"点击进入我的直播" icon:livingIcon userInfo:nil];
    
    application.shortcutItems = @[searceItem,livingItem,courseItem,messageItem];
}

/**
 3D Touch 按钮点击事件（用户通过在主屏幕上选择快捷方式激活应用程序的回调方法）
 */
-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
    ChXDemoViewController *demoVC = [[NSClassFromString(@"ChXDemoViewController") alloc] init];
    
    // 根视图控制器
    UINavigationController *rootNav = (UINavigationController *)self.window.rootViewController;
    
    if ([shortcutItem.type isEqualToString:@"com.268.search"]) { // 搜索
//        UIViewController *searchVc = [[NSClassFromString(@"SearchViewController") alloc] init];
//        [self.mainController pushViewController:searchVc animated:YES];
        demoVC.titleName = @"进入了搜索页面";
        
    } else if ([shortcutItem.type isEqualToString:@"com.268.message"]) { // 系统消息
//        if ([USERID integerValue] != 0) {
//            UIViewController *nextVc = [[NSClassFromString(@"NoticeViewController") alloc]init];
//            [self.mainController pushViewController:nextVc animated:NO];
//        } else {
////            [self showLoginViewController:self.mainController];
//        }
        
        demoVC.title = @"进入消息";
    } else if ([shortcutItem.type isEqualToString:@"com.268.course"]) {
//        if ([USERID integerValue] != 0) {
//            UIViewController *nextVC = [[NSClassFromString(@"MyCourseTableViewController") alloc] init];
////            [self.mainController pushViewController:nextVC animated:NO];
//        } else {
////            [self showLoginViewController:self.mainController];
//        }
        demoVC.title = @"进入课程";

    } else if ([shortcutItem.type isEqualToString:@"com.268.living"]) {
//        if ([USERID integerValue] != 0) {
//            UIViewController *nextVC = [[NSClassFromString(@"ChXMyLiveController") alloc] init];
////            [self.mainController pushViewController:nextVC animated:NO];
//        } else {
////            [self showLoginViewController:self.mainController];
//        }
        demoVC.title = @"进入直播";
        
    } else {
    }
    
    [rootNav presentViewController:demoVC animated:YES completion:nil];
    
}


@end
