//
//  BJClosureViewController.swift
//  BJSwiftDemo
//
//  Created by zhangwenjun on 2019/6/19.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import UIKit

typealias ClosureType = (String) -> Void

class BJClosureViewController: UIViewController {
    
    var myClosure: ClosureType? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let btn: UIButton = UIButton.init(type: UIButton.ButtonType.custom)
        btn.setTitle("返回", for: .normal)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(btnAction), for: UIControl.Event.touchUpInside)
        self.view.addSubview(btn)
        
    }
    
    @objc func btnAction() {
        if self.myClosure != nil {
            self.myClosure!("我是闭包传来的")
        }
        self.navigationController?.popViewController(animated: true)
    }
}
