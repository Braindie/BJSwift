//
//  BJGenericsViewController.swift
//  BJSwiftDemo
//
//  Created by zhangwenjun on 2019/6/19.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import UIKit

class BJGenericsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "泛型"
        
        let btn:UIButton = UIButton.init(type: UIButton.ButtonType.custom)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        btn.setTitle("调用", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(btnAction), for: UIControl.Event.touchUpInside)
        self.view.addSubview(btn)
    }
    
    @objc func btnAction() {
    
        var numb1 = 100
        var numb2 = 200
        
        print("交换前：\(numb1)、\(numb2)")
        swapTwoValue(&numb1, &numb2)
        print("交换后：\(numb1)、\(numb2)")

        
        var str1 = "A"
        var str2 = "B"
        
        print("交换前：\(str1)、\(str2)")
        swapTwoValue(&str1, &str2)
        print("交换后：\(str1)、\(str2)")
    }
    
    //泛型
    func swapTwoValue<T>(_ a: inout T, _ b: inout T) {
        let temp = a
        a = b
        b = temp
    }
}
