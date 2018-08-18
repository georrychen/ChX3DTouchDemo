//
//  TableViewController_A.swift
//  ChX3DTouch(Swift4.0)
//
//  Created by Xu Chen on 2018/8/18.
//  Copyright © 2018年 xu.yzl. All rights reserved.
//

import UIKit

class TableViewController_A: UITableViewController ,UIViewControllerPreviewingDelegate{

    /// 详情页预览选项数组
    private lazy var detailPreviewActionItems = [UIPreviewAction]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.green
        tableView.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "cellId")
        
        configureDetailPreviewItems()
    }

    func configureDetailPreviewItems() {
        let action1 = UIPreviewAction.init(title: "删除",
                                           style: .destructive) { (_, _) in
                                            print("删除了~")
        }
        let action2 = UIPreviewAction.init(title: "返回",
                                           style: .default) { (_, _) in
                                            print("返回了~")
        }
        detailPreviewActionItems = [action1, action2]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.textLabel?.text = "第 \(indexPath.row) 行"
        
        // 判断是否支持 3D Touch
        if #available(iOS 9.0, *) {
            if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
                // 注册 Peek & Pop 功能
                registerForPreviewing(with: self, sourceView: cell)
            }
        }
        
        return cell
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        // 1. 获取当前按压 cell 所在的行
        guard let cell = previewingContext.sourceView as? UITableViewCell else {
            return UIViewController()
        }
        let indexPath = tableView.indexPath(for: cell) ?? IndexPath(row: 0, section: 0)
        
        // 2. 设置预览界面
        let nextVc = DemoViewController()
        nextVc.name = "第 \(indexPath.row) 行过来的"
        nextVc.items = detailPreviewActionItems
        
        return nextVc
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        show(viewControllerToCommit, sender: self)
    }

}
