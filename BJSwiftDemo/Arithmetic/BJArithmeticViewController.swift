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
        
        let arr = [6,5,7,1,3,2,4]
        

//        two.right = twoRight
//
//        let value = self.isSameTree(one, two)
        
//        let value = self.isSymmetric(one)
        
//        let value = self.merageSorting(arr: arr)
        
        let value = self.quickSorting(arr: arr)
    
//        let value = levelOrderBottom(one)
        
//        let value = self.sortedArrayToBST([1,3,4,5,12,34,56,65,76,88,235,444])
        
//        let value = self.reverseList(one)
        
//        let value = self.firstUniqChar("abcdabc")
        
        
        print("结果：",value)
    }
    
    
    
    //MARK: - 排序
    
    //MARK: -
    //MARK: 冒泡排序，（原地排序，稳定排序，O(n*n)）
    
    func bubbleSorting(arr: [Int]) -> Array<Int> {
        var sortArr: [Int] = arr
        let n = sortArr.count
        
        for i in 0..<n {
            for j in 0..<n-1-i {
                if sortArr[j] > sortArr[j+1] {
                    sortArr.swapAt(j, j+1)
                }
                print(sortArr)
            }
            // 冒泡遍历一次，最大数归位
            print("\n")
        }
        return sortArr
    }
    

    
    
    //MARK: 插入排序，（原地排序，稳定排序，O(n*n)）
    // 比冒泡优化空间大，看希尔排序
    func insertSorting(arr: [Int]) -> Array<Int> {
        var sortArr = arr
        let n = sortArr.count
        
        for i in 0..<n {
            for j in stride(from: i, to: 0, by: -1) {
                if sortArr[j] < sortArr[j-1] {
                    sortArr.swapAt(j, j-1)
                }
                print(sortArr)
            }
            // 第n次遍历，前n位顺序已排
            print("\n")
        }
        return sortArr
    }
    
    //MARK: 希尔排序
    var data: [Int] = Array()
    func shellSorting(arr: [Int]) -> Array<Int> {
        self.data = arr
        let incremental = arr.count
        recursiveShellSort(incremental: incremental)
        return self.data
    }
    func recursiveShellSort(incremental: Int) {
        if incremental == 0 {
            return
        }
        for index in 0..<data.count - incremental {
            let a = data[index]
            let b = data[index + incremental]
            if a > b {
                data.swapAt(index, index+incremental)
            }
            print(data)
        }
        print("\n")
        
        // 递归
        recursiveShellSort(incremental: incremental/2)
    }
    
    
    
    
    //MARK: 选择排序（原地排序，非稳定排序，O(n*n)）
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
            // 遍历一次，最小数归位
            print(sortArr)
            print("\n")
        }
        return sortArr
    }
    
    
    

    
    
    
    
    
    
    
    
    
    
    //MARK: 归并排序（非原地排序，稳定排序，O(n*logn)，空间复杂度O(n)）
    var sortArr: [Int] = Array()
    func merageSorting(arr: [Int]) -> Array<Int> {
        sortArr = arr
        let n = sortArr.count
        print("原数组",sortArr);
        
        recursiveSort(l: 0, r: n-1)
        return sortArr
    }
    func recursiveSort(l: Int, r: Int) {
        if l >= r {
            return
        }
        let mid = (l + r)/2
        // 递归、分治
        recursiveSort(l: l, r: mid)
        recursiveSort(l: mid+1, r: r)

        // 合并分割的数组（合并两个有序子数组）
        merge(l: l, mid: mid, r: r)
        print(sortArr)
    
        print("\n")
    }
    // 合并函数
    func merge(l: Int, mid: Int, r: Int) {
        var aux: [Int] = Array()
        for i in l..<r+1 {
            aux.append(sortArr[i])
            print("aux",aux)
        }

        var i = l
        var j = mid+1
        
        // 没懂
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
            print("sortArr",sortArr)
        }
    }
    
    
    //MARK: -- 快速排序（快速排序的优化策略）
    var qArr: [Int] = Array()
    
    func quickSorting(arr: [Int]) -> Array<Int> {
        qArr = arr
        print("原数组",qArr);
        let n = qArr.count
        
        recursiveQuickSort(l: 0, r: n-1)
        return self.qArr
    }
    func recursiveQuickSort(l: Int, r: Int) {
        if l >= r {
            return
        }
        // 分治、递归
        let p = partition(l: l, r: r)
        recursiveQuickSort(l: l, r: p-1)
        recursiveQuickSort(l: p+1, r: r)
    }
    // 分区函数
    func partition(l: Int, r: Int) -> Int {
        let x = qArr[l]
        var i = l
        var j = r
        while i < j {
            // 从右向左找小于x的数来填s[i]
            while i < j && qArr[j] >= x {
                j -= 1
            }
            if i < j {
                qArr[i] = qArr[j] //将s[j]填到s[i]中，s[j]就形成了一个新的坑
                i += 1
            }
            // 从左向右找大于或等于x的数来填s[j]
            while i < j && qArr[i] < x {
                i += 1
            }
            if i < j {
                qArr[j] = qArr[i] //将s[i]填到s[j]中，s[i]就形成了一个新的坑
                j -= 1
            }
            print(qArr)
        }
        qArr[i] = x //退出时，i等于j。将x填到这个坑中。完成x左边都小于x，x右边都大于x
        
        print(i)
        print(qArr)
        return i
    }
    //MARK: 快速排序（快速排序的优化策略）
    
    
    
    //MARK: - 查找
    //MARK: 顺序查找
    
    //MARK: -- 二分查找（O(logn)）
    // 1、依赖顺序表结构，2、针对的是有序数据，3、数据量太小不适合，顺序遍历就足够了，4、数据量太大也不合适，因为需要***连续***的内存空间（数组）来存储
    func binarySearch(list: [Int], key: Int) -> Int {
        var low = 0
        var high = list.count - 1
        var time = 0
        while low <= high {
            time += 1
//            let mid = (low + high) / 2 // 可能会溢出
            let mid = low + (high-low)/2
            
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
    // 凡是用二分查找能解决的，绝大部分更倾向于用散列表或二叉查找数
    // 变体的二分查找容易出错：1、终止条件；2、区间上下界更新方法；3、返回值选择
    // 下面的“近似”查找问题可用二分查找：1、查找第一个值等于给定值的元素；2、查找最后一个值等于给定的元素；3、查找第一个大于等于给定值的元素；4、查找最后一个值小于等于给定值的元素
    
    
    
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
    
}
