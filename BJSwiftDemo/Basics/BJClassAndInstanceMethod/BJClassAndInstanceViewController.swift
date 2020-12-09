//
//  BJClassAndInstanceViewController.swift
//  BJSwiftDemo
//
//  Created by zhangwenjun on 2019/6/18.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import UIKit

class BJClassAndInstanceViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        //调用类方法
        let randomNum = BJMethodes.getRandomNum()
        print(randomNum)
        
        //调用实例方法
        let ins = BJMethodes.init()
        let num = ins.getParam()
        print(num)
        
    }
}
