//
//  DemoViewController.swift
//  ChX3DTouch(Swift4.0)
//
//  Created by Xu Chen on 2018/8/18.
//  Copyright © 2018年 xu.yzl. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    var items: [UIPreviewAction]?
    
    /// 标题
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.groupTableViewBackground
        titleLabel.text = (name ?? "")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    
    override var previewActionItems: [UIPreviewActionItem] {
        return items ?? []
    }
    
}
