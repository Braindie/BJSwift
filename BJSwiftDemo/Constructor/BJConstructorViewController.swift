//
//  BJConstructorViewController.swift
//  BJSwiftDemo
//
//  Created by zhangwenjun on 2019/6/19.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import UIKit

class BJConstructorViewController: UIViewController {
    
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
        
        let person = Person.init(age: 18)
        print(person)
        
        let student = Student.init(name: "lishi")
        print(student)
        
    }
}

//MARK:- 无继承
class Person {
    var name: String
    
    var age: Int
    
    // 可以存在多个指定初始化器
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    // 可以存在多个指定初始化器
    init(age: Int) {
        self.name = "zhangsan"
        self.age = age
    }
    
    // 便利初始化器
    convenience init(name: String) {
        // 必须调用自己的指定初始化器
        self.init(name: name, age: 18)
        
        // 初始化完成之后才能调用实例方法
        jump()
    }

    func jump() {

    }
}

//MARK:- 有继承
class Student: Person {
    
    // 如果子类没有新的非可选类型的属性，或者保证所有非可选类型属性都有默认值，则可以直接继承父类的指定初始化器或便利初始化器
//    var score: Double = 100.0
    
    //否则、需要创建新的指定初始化器（a）或重写父类的指定初始化器（b）
    var score: Double
    
    
    // a、新创建的指定初始化器会覆盖父类的指定初始化器，需要先给当前非可选类型属性赋值，然后调用父类的指定初始化器
    init(name: String, age: Int, score: Double) {
        self.score = score
        super.init(name: name, age: age)
    }
    
    // b、重写父类的指定初始化器，需要先给当前非可选类型属性赋值，然后调用父类的指定初始化器
    override init(name: String, age: Int) {
        self.score = 100.0
        super.init(name: name, age: age)
    }
    
    
    
    // 便利初始化器
    convenience init(name: String) {
        // 必须调用自己的指定初始化器
        self.init(name: name, age: 18, score: 100.0)
    }
    
}
