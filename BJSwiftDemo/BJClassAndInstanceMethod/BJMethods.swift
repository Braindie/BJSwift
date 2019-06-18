//
//  BJMethods.swift
//  BJSwiftDemo
//
//  Created by zhangwenjun on 2019/6/18.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import Foundation

class BJMethodes: NSObject {
    
    //类方法
    //static也可以声明类方法
    class func getRandomNum() -> NSInteger {
        let randomNum = NSInteger(arc4random()%365) + 1
        
        return randomNum;
    }
    
    //实例方法
    func getParam() -> String {
        return "test"
    }
}

