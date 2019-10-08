//
//  BJArithmeticViewController.swift
//  BJSwiftDemo
//
//  Created by zhangwenjun on 2019/9/9.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import Foundation
import UIKit

// 链表
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
        
//        let value = self.twoSum(nums: [1, 2, 3], targer: 4)
        
//        let value = self.reverse(x: 123)
        
//        let value = self.isPalindrome(x: 12321)
        
//        let value = self.romanToInt(s: "I")
        
//        let value = self.longestCommonPrefix(["abcdfghikd", "abcde", "abef"])
        
//        let value = self.isValid("(())())")
        
//        let l1 = ListNode.init(1)
//        let l2 = ListNode.init(2)
//        let value = self.mergeTwoLists(l1, l2)
        
//        var list = [1, 1, 2]
//        let value = self.removeDuplicates(&list)
        
        
//        var list = [1, 1, 2,4]
//        let value = self.removeElement(&list, 1)
        
//        let value = self.searchInsert([1, 2, 3, 4], 2)
        
        
        
        let one = ListNode(1)
        let two = ListNode(1)
        let three = ListNode(2)
        let four = ListNode(2)
        let five = ListNode(3)
        let six = ListNode(4)
        
        one.next = two
        two.next = three
        three.next = four
        four.next = five
        five.next = six
        
        let value = self.deleteDuplicates(one)
        
        while value?.next != nil {
            print("node val: \(value?.val)")
        }
        
        
//        print(value)
        
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

    //MARK:- 21、合并两个有序链表
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
    
    //MARK:- 26、删除排序数组中的重复项
    func removeDuplicates(_ nums: inout [Int]) -> Int { // inout泛型里面有
        if nums.count == 0 {
            return 0
        }
        var i = 0
        for (index, item) in nums.enumerated() {
            if index == 0 {
                continue
            }
            print(index)
            if nums[i] != nums[index] {
                i += 1
                nums[i] = nums[index]
            }
        }
        print(nums)
        return i + 1
    }
    
    //MARK:- 27、移除元素
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        for (index, item) in nums.enumerated() {
            if nums[index] != val {
                nums[i] = nums[index]
                i += 1
            }
        }
        return i
    }
    
    //MARK:- 28、实现strStr（）
    func strStr(_ haystack: String, _ needle: String) -> Int {
        var pat = haystack
        var txt = needle

        let M = haystack.count
        let N = needle.count
//        for i in 0...M-N {
//            for j in 0...N {
//                if pat[j] != txt[j] {
//                    break
//                }
//            }
//
//        }
        return 1
    }
    
    //MARK:- 35、搜索插入位置
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        let len = nums.count
        if nums[len - 1] < target {
            return len
        }
        
        var left = 0
        var right = len - 1
        
        while left <= right { // 二分法
            let mid = (left + right) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return left
    }
    
    //MARK:- 83、删除排序链表中的重复元素
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var current = head
        while current != nil && current?.next != nil {
            if current!.next!.val == current!.val {
                current!.next = current!.next!.next
            } else {
                current = current?.next
            }
        }
        return head
    }
    
}
