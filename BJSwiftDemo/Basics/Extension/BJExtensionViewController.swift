//
//  BJExtensionViewController.swift
//  BJSwiftDemo
//
//  Created by zhangwenjun on 2019/6/18.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import UIKit

class BJExtensionViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.myRed
        
    }
}

extension UIColor {
    class var myRed: UIColor {
        return UIColor.red
    }
}
