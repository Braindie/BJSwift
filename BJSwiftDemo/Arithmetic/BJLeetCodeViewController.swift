//
//  BJLeetCodeViewController.swift
//  BJSwiftDemo
//
//  Created by 张文军 on 2020/12/9.
//  Copyright © 2020 zcgt_ios_01. All rights reserved.
//

import UIKit

class BJLeetCodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.white;
        
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
        
//        let value = self.hasCycle(head: one)
        

//        let value = self.deleteDuplicates(one)
//
//        while value?.next != nil {
//            print("node val: \(value?.val)")
//        }
        
        
//        let one = TreeNode(4)
//        let oneLeft = TreeNode(7)
//        let oneRight = TreeNode(8)
//        let node = TreeNode(9)
//        let node2 = TreeNode(10)
//
//        one.left = oneLeft
//        one.right = oneRight
//        oneLeft.right = node
//        node.right = node2
//
//        let two = TreeNode(1)
//        let twoLeft = TreeNode(2)
//        let twoRight = TreeNode(3)
//        two.left = twoLeft
//        two.right = twoRight
//
//        let value = self.isSameTree(one, two)
        
//        let value = self.isSymmetric(one)
        
//        let value = self.quickSorting(arr: [6,5,7,1,3,2,4])
    
//        let value = levelOrderBottom(one)
        
//        let value = self.sortedArrayToBST([1,3,4,5,12,34,56,65,76,88,235,444])
        
//        let value = self.reverseList(one)
        
        let value = self.firstUniqChar("abcdabc")
        
        
        
        print(value)
        
    }

    
    
    //MARK:- 《《《---LeetCode---》》》
    //MARK: 1、两数之和
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
    
    
    //MARK: 7、整数反转
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
    

    //MARK: 9、回文数
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
    
    
    //MARK: 13、罗马数字转整数
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
    
    
    //MARK: 14、最长公共前缀
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
    
    //MARK: 20、有效的括号
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

    //MARK: 21、合并两个有序链表
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
    
    //MARK: 26、删除排序数组中的重复项
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
    
    //MARK: 27、移除元素
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
    
    //MARK: 28、实现strStr（）
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
    
    //MARK: 35、搜索插入位置
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
    
    //MARK: 83、删除排序链表中的重复元素
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
    
    //MARK: 100、相同的树
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        if p == nil || q == nil {
            return false
        }
        if p?.val != q?.val {
            return false
        }
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
    
    //MARK: 101、对称二叉树
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isMirror(root, root)
    }
    func isMirror(_ t1: TreeNode?, _ t2: TreeNode?) -> Bool {
        if t1 == nil && t2 == nil {
            return true
        }
        if t1 == nil || t2 == nil {
            return false
        }
        return (t1?.val == t2?.val) && isMirror(t1?.left, t2?.right) && isMirror(t1?.right, t2?.left)
    }
    
    //MARK: 104、二叉树的最大深度
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        } else {
            let left_height = maxDepth(root?.left)// 深度优先搜索
            let right_height = maxDepth(root?.right)
            return max(left_height, right_height) + 1
        }
    }
    
    //MARK: 107、二叉树的层次遍历（二）
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let r = root else { // 类似于if
            return [[Int]]()
        }
        var result = [[Int]]()
        var queue = [TreeNode]()
        queue.append(r)
        while queue.count > 0 {
            let layer = Array(queue) // 队列，广度优先搜索
            var layerVal = [Int]()
            queue.removeAll()
            for node in layer {
                layerVal.append(node.val)
                if let l = node.left {
                    queue.append(l)
                }
                if let r = node.right {
                    queue.append(r)
                }
            }
            result.insert(layerVal, at: 0)
        }
        return result
    }
    
    //MARK: 108、将有序数组转换为二叉搜索树
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return sortedArrayToBST(nums, 0, nums.count)
    }
    func sortedArrayToBST(_ nums: [Int], _ start: Int, _ end: Int) -> TreeNode? {
        if start == end {
            return nil
        }
        let mid = (start + end) / 2
        let root = TreeNode(nums[mid])
        root.left = sortedArrayToBST(nums, start, mid)
        root.right = sortedArrayToBST(nums, mid + 1, end)
        return root
    }
    
    //MARK: 141、环形链表
    func hasCycle(head: ListNode) -> Bool {
        // 方法一：哈希表、检查一个结点此前是否被访问过来判断链表是否是环形链表
        
        // 方法二：双指针
        if head == nil || head.next == nil {
            return false
        }
        var slow: ListNode! = head
        var fast = head.next
        while slow !== fast {
            if fast == nil || fast?.next == nil {
                return false
            }
            slow = slow.next
            fast = fast?.next?.next
        }
        return true
    }
    
    //MARK: 110、平衡的二叉树
    func isBalanced(_ root: TreeNode?) -> Bool {
        return depth(root) != -1
    }
    func depth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let left = depth(root?.left)
        if left == -1 {
            return -1
        }
        let right = depth(root?.right)
        if right == -1 {
            return -1
        }
        return abs(left - right) < 2 ? max(left, right) + 1 : -1 // 如果超过2就退出递归了
    }
    
    //MARK: 206、反转链表
    func reverseList(_ head: ListNode?) -> ListNode? {
        // 方法一：迭代
        var prev: ListNode?
        prev = nil
        var curr = head
        while curr != nil {
            let nextTemp = curr?.next
            curr?.next = prev
            prev = curr
            curr = nextTemp
        }
        return prev
        
        // 方法二：递归
        if head == nil || head?.next == nil {
            return head
        }
        let p = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return p
    }
    
    //MARK: 387、字符串中的第一个唯一字符
    func firstUniqChar(_ s: String) -> Int {
        var set = Set<Character>()
        var index = 0
        for char in s {
            if !set.contains(char) {// 如果重复了就不进去判断了
                set.insert(char)
                // 最后的char角标是否等于当前循环的char的角标
                if s.lastIndex(of: char)! == s.index(s.startIndex, offsetBy: index) {
                    return index
                }
            }
            index += 1
        }
        return -1
    }

}
