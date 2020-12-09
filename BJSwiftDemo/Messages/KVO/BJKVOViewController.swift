//
//  BJKVOViewController.swift
//  BJSwiftDemo
//
//  Created by zhangwenjun on 2019/6/19.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import UIKit

//纯OC的特性
//使用KVO需要继承NSObject，并添加@objc
class UserModel: NSObject {
    @objc dynamic var name: String = "张三"
}

class BJKVOViewController: UIViewController {
    
    let model = UserModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let btn: UIButton = UIButton.init(type: UIButton.ButtonType.custom)
        btn.setTitle("修改", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        btn.addTarget(self, action: #selector(btnAction), for: UIControl.Event.touchUpInside)
        self.view.addSubview(btn)
        
        model.addObserver(self, forKeyPath: "name", options: [.new, .old], context: nil)
        
    }
    
    @objc func btnAction() {
        self.model.name = "李四";
        print(self.model.name)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("name改变了")
    }
}
