//
//  ViewController.swift
//  ChX3DTouch(Swift4.0)
//
//  Created by Xu Chen on 2018/8/18.
//  Copyright © 2018年 xu.yzl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        show(TableViewController_A(), sender: self)
    }


}

