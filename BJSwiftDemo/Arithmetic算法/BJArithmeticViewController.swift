//
//  BJArithmeticViewController.swift
//  BJSwiftDemo
//
//  Created by zhangwenjun on 2019/9/9.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import Foundation
import UIKit

class BJArithmeticViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.white;
        self.navigationItem.title = "算法";
        
        let array = self.twoSum(nums: [1, 2, 3], targer: 4)
        print(array)
    }
    
    
//    两数之和
    func twoSum(nums: [Int], targer: Int) -> [Int]{
        var someArray = [Int]()
        
        for i in 0..<nums.count-1 {
            let n = nums[i]
            for j in i+1..<nums.count {
                let m = nums[j]
                if n + m == targer{
                    someArray = [i, j]
                }
            }
        }
   
        return someArray
    }
}
