//
//  BJConstructorViewController.swift
//  BJSwiftDemo
//
//  Created by zhangwenjun on 2019/6/19.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import UIKit

class BJConstructorViewController: UIViewController {
    
    var ques: Question?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "构造器"
        
        struct fat {
            var temp: Double
            init() {
                temp = 32.0
            }
        }
        
        print(fat())
        
        
    }
}

//初始化时给常量赋值
//初始化时可以给常量赋值,只能在定义的类中, 不能被子类赋值
class Question {
    let text: String
    init(text: String) {
        self.text = text
    }
    
    let beetsQuestion = Question(text: "hello")
    
}
