//
//  AppDelegate.swift
//  ChX3DTouch(Swift4.0)
//
//  Created by Xu Chen on 2018/8/18.
//  Copyright © 2018年 xu.yzl. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        configure3DTouch(application: application)

        return true
    }

    /// 配置 3D Touch
    ///
    /// - Parameter application: UIApplication
    func configure3DTouch(application: UIApplication) {

        // 判断当前设置是否支持 3D Touch
        if #available(iOS 9.0, *) {
            if window?.traitCollection.forceTouchCapability != UIForceTouchCapability.available {
                print("3D touch 不可用")
                return;
            }
        } else {
            print("3D touch 不可用")
            return
        }
    
        // 添加 item
        let searchIcon = UIApplicationShortcutIcon.init(type: .search)
        let searchItem = UIApplicationShortcutItem.init(type: "com.268.search",
                                                        localizedTitle: "搜一搜",
                                                        localizedSubtitle: "点击进入搜索",
                                                        icon: searchIcon,
                                                        userInfo: nil)
        
        let livingIcon = UIApplicationShortcutIcon.init(templateImageName: "我的_我的直播")
        let livingItem = UIApplicationShortcutItem.init(type: "com.268.living",
                                                        localizedTitle: "直播",
                                                        localizedSubtitle: nil,
                                                        icon: livingIcon,
                                                        userInfo: nil)
        application.shortcutItems = [searchItem, livingItem]

    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        let rootVc = window?.rootViewController
        let nextVc = DemoViewController()
        
        // 根据 type 唯一标识进行判断跳转
        switch shortcutItem.type {
        case "com.268.search":
            nextVc.name = "搜索页面"
        default:
             nextVc.name = "直播页面"
        }
        rootVc?.present(nextVc, animated: true, completion: nil)
    }

}

