//
//  BJArithmeticViewController.swift
//  BJSwiftDemo
//
//  Created by zhangwenjun on 2019/9/9.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import Foundation
import UIKit

public class ListNode { // 链表节点
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}



class BJArithmeticViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.white;
        self.navigationItem.title = "算法";
        
//        let array = self.twoSum(nums: [1, 2, 3], targer: 4)
//        print(array)
        
//        let i = self.reverse(x: 123)
//        print(i)
        
//        let isPa = self.isPalindrome(x: 12321)
//        print(isPa)
        
//        let value = self.romanToInt(s: "I")
//        print(value)
        
//        let value = self.longestCommonPrefix(["abcdfghikd", "abcde", "abef"])
//        print(value)
        
//        let value = self.isValid("(())())")
//        print(value)
        
        let l1 = ListNode.init(1)
        let l2 = ListNode.init(2)

        let value = self.mergeTwoLists(l1, l2)
        print(value)
        
        
    }
    
    
    //MARK:- 1、两数之和
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
    
    
    //MARK:- 7、整数反转
    func reverse(x: Int) -> Int {
        var xx = x    //Swift是静态类型的语言，也就是说编译器在编译过程中会检查出类型错误，并提示开发者尽早修正程序中存在的问题。
        var rev = 0
        while xx != 0 {
            let pop = xx % 10
            xx = xx / 10
            if (rev > Int32.max / 10 || (rev == Int32.max / 10 && pop > 7 )) {
                return 0
            }
            if (rev < Int32.min / 10 || (rev == Int32.min / 10 && pop < -8)) {
                return 0
            }
            rev = rev * 10 + pop
        }
        return rev
    }
    

    //MARK:- 9、回文数
    func isPalindrome(x: Int) -> Bool {
        if (x < 0 || (x % 10 == 0 && x != 0)) {
            return false
        }
        
        var revertedNumber = 0
        var xx = x
        
        while (xx > revertedNumber) {
            revertedNumber = revertedNumber * 10 + xx % 10
            xx = xx / 10
        }
        return xx == revertedNumber || xx == revertedNumber / 10
    }
    
    
    //MARK:- 13、罗马数字转整数
    func romanToInt(s: String) -> Int {
        let dict: [Character : Int] = ["I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000]
        var lastNum = 0
        var result = 0
        for c in s {
            let num = dict[c]!
            result += num
            if num > lastNum {
                result -= 2*lastNum
            }
            lastNum = num
        }
        return result
    }
    
    
    //MARK:- 14、最长公共前缀
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else { return "" }
        var prefix = strs[0]
        
        for i in 1..<strs.count {
            let str = strs[i]
            while !str.hasPrefix(prefix) { // 循环
                prefix.removeLast() // 删除最后一个字符
                print(str+"+"+prefix)

                if prefix == "" { return "" }
            }
        }
        return prefix
    }
    
    //MARK:- 20、有效的括号
    func isValid(_ s: String) -> Bool {
        var stack = [Character]() // 模拟栈
        let dict = [")":"(", "]":"[", "}":"{"] // 索引
        
        for c in s {
            print(c)
            if !dict.keys.contains(String(c)) {
                stack.append(c) // 左括号入栈
            }else if stack.count > 0, String( stack.last! ) == dict[String(c)] {
                stack.removeLast() // 右括号出栈
            } else {
                return false
            }
        }
        return stack.isEmpty
    }

    //MARK:- 合并两个有序列表
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        } else if l2 == nil {
            return l1
        } else if (l1!.val < l2!.val) {
            l1?.next = self.mergeTwoLists(l1?.next, l2)
            return l1
        } else {
            l2?.next = self.mergeTwoLists(l1, l2?.next)
            return l2
        }
    }
}
