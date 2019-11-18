//
//  BJArithmeticViewController.swift
//  BJSwiftDemo
//
//  Created by zhangwenjun on 2019/9/9.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import Foundation
import UIKit

//MARK:- 链表
public class ListNode { // 链表节点
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

//MARK:- 树
public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
}


//MARK:-
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
    //MARK:- 排序算法
    //MARK: 冒泡排序
    func bubbleSorting(arr: [Int]) -> Array<Int> {
        var sortArr: [Int] = arr
        for i in 0..<sortArr.count {
            for j in 0..<sortArr.count-1-i {
                if sortArr[j] > sortArr[j+1] {
                    sortArr.swapAt(j, j+1)
                }
                print(sortArr)
            }
        }
        return sortArr
    }
    
    //MARK: 选择排序
    func selectionSorting(arr: [Int]) -> Array<Int> {
        var sortArr = arr
        let n = sortArr.count
        for i in 0..<n {
            var minIndex = i //寻找[i, n)区间最小的值
            for j in (i+1)..<n {
                if sortArr[minIndex] > sortArr[j] {
                    minIndex = j
                }
            }
            sortArr.swapAt(i, minIndex)
        }
        return sortArr
    }
    
    //MARK: 插入排序
    func insertSorting(arr: [Int]) -> Array<Int> {
        var sortArr = arr
        for i in 0..<sortArr.count {
            for j in stride(from: i, to: 0, by: -1) {
                if sortArr[j] < sortArr[j-1] {
                    sortArr.swapAt(j, j-1)
                }
            }
        }
        return sortArr
    }
    
    //MARK: 希尔排序
    var data: [Int] = Array()
    func shellSorting(arr: [Int]) -> Array<Int> {
        self.data = arr
        let incremental = arr.count
        recursiveShellSort(incremental: incremental) // 先递归
        self.data = insertSorting(arr: self.data) // 插入排序
        return self.data
    }
    func recursiveShellSort(incremental: Int) { // 递归
        if incremental == 0 {
            return
        }
        for index in 0..<data.count - incremental {
            let a = data[index]
            let b = data[index + incremental]
            if a > b {
                data.swapAt(index, index+incremental)
            }
        }
        recursiveShellSort(incremental: incremental/2)
    }
    
    //MARK: 归并排序
    var sortArr: [Int] = Array()
    func merageSorting(arr: [Int]) -> Array<Int> {
        sortArr = arr
        recursiveSort(l: 0, r: arr.count-1)
        return sortArr
    }
    func recursiveSort(l: Int, r: Int) {
        if l >= r {
            return
        }
        let mid = (l + r)/2
        print("开始")
        print(mid)
        recursiveSort(l: l, r: mid)
        recursiveSort(l: mid+1, r: r)
        print("递归结束")
        print(mid)
        merge(l: l, mid: mid, r: r)
    }
    func merge(l: Int, mid: Int, r: Int) {
        var aux: [Int] = Array()
        for i in l..<r+1 {
            aux.append(sortArr[i])
        }
        print(aux)
        
        var i = l
        var j = mid+1
        
        for k in l..<r+1 {
            if i > mid {
                sortArr[k] = aux[j-l]
                j += 1
            } else if j > r {
                sortArr[k] = aux[i-l]
                i += 1
            } else if aux[i-l] - aux[j-l] < 0 {
                sortArr[k] = aux[i-l]
                i += 1
            } else {
                sortArr[k] = aux[j-l]
                j += 1
            }
        }
    }
    
    
    //MARK: 快速排序
    var qArr: [Int] = Array()
    
    func quickSorting(arr: [Int]) -> Array<Int> {
        self.qArr = arr
        recursiveQuickSort(l: 0, r: qArr.count-1)
        return self.qArr
    }
    func recursiveQuickSort(l: Int, r: Int) {
        if l >= r {
            return
        }
        let p = partition(l: l, r: r)
        recursiveQuickSort(l: l, r: p-1)
        recursiveQuickSort(l: p+1, r: r)
    }
    func partition(l: Int, r: Int) -> Int {
        let v = qArr[l]
        var j = l
        for i in l+1..<r+1 {
            if qArr[i] < v {
                j += 1
            }
        }
        qArr.swapAt(l, j)
        print(qArr)
        return j
    }
    
    //MARK:- 查找
    //MARK: 顺序查找
    
    //MARK: 二分查找
    func binarySearch(list: [Int], key: Int) -> Int {
        var low = 0
        var high = list.count - 1
        var time = 0
        while low <= high {
            time += 1
            let mid = (low + high) / 2
            if key < list[mid] {
                high = mid - 1
            } else if key > list[mid] {
                low = mid + 1
            } else {
                print(time)
                return mid
            }
        }
        return 0
    }
    
    //MARK: 插值查找
    func insertSearch(list: [Int], key: Int) -> Int {
        var low = 0
        var high = list.count - 1
        var time = 0
        while low <= high {
            time += 1
            // 计算mid值是插值算法的核心代码
            let mid = low + (high - low) * (key - list[low])/(list[high] - list[low])
            if key < list[mid] {
                high = mid - 1
            } else if key > list[mid] {
                low = mid + 1
            } else {
                print(time)
                return mid
            }
        }
        return 0
    }
    
    //MARK: 斐波那契查找
    func fibonacciSearch(list: [Int], key: Int) -> Int {
        let F = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144,
                 233, 377, 610, 987, 1597, 2584, 4181, 6765,
                 10946, 17711, 28657, 46368]
        
        var low = 0
        var high = list.count - 1
        var mid = 0
        
        var arr = list
        
        // 为了使得查找表满足斐波那契特性，在表的最后添加几个同样的值
        // 这个值是原查找表的最后那个元素的值
        // 添加的个数由F[k]-1-high决定
        var k = 0
        while high > F[k] - 1 {
            k += 1
        }
        print(k)
        var i = high
        while F[k]-1 > i {
            arr.append(arr[high])
            i += 1
        }
        print(arr)
        
        // 主逻辑
        var time = 0
        while low <= high {
            time += 1
            // 防止F列表下标溢出
            if k < 2 {
                mid = low
            } else {
                mid = low + F[k-1] - 1
            }
            
            if key < arr[mid] {
                high = mid - 1
                k -= 1
            } else if key > arr[mid] {
                low = mid + 1
                k -= 2
            } else {
                print(time)
                if mid <= high {
                    return mid
                } else {
                    return high
                }
            }
        }
        return 0
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
    
    //MARK:- 100、相同的树
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
    
    //MARK:- 101、对称二叉树
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
    
    //MARK:- 104、二叉树的最大深度
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        } else {
            let left_height = maxDepth(root?.left)// 深度优先搜索
            let right_height = maxDepth(root?.right)
            return max(left_height, right_height) + 1
        }
    }
    
    //MARK:- 107、二叉树的层次遍历（二）
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
    
    //MARK:- 108、将有序数组转换为二叉搜索树
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
    
    //MARK:- 141、环形链表
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
    
    //MARK:- 110、平衡的二叉树
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
    
    //MARK:- 206、反转链表
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
    
    //MARK:- 387、字符串中的第一个唯一字符
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
