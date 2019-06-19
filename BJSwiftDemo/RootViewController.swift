//
//  RootViewController.swift
//  CalculatorDemo
//
//  Created by zhangwenjun on 2019/6/14.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ClickDelegate{

    

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTableView.delegate = self;
        self.myTableView.dataSource = self;
    }
    


    //MARK: - delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        if indexPath.row == 0 {
            cell.textLabel?.text = "1、计算器"
        } else if indexPath.row == 1 {
            cell.textLabel?.text = "2、多态（同OC）"
        } else if indexPath.row == 2 {
            cell.textLabel?.text = "3、代理"
        } else if indexPath.row == 3 {
            cell.textLabel?.text = "4、类方法与实例方法"
        } else if indexPath.row == 4 {
            cell.textLabel?.text = "5、KVC，KVO"
        } else if indexPath.row == 5 {
            cell.textLabel?.text = "6、扩展"
        } else if indexPath.row == 6 {
            cell.textLabel?.text = "7、闭包（类比Block）"
        } else if indexPath.row == 7 {
            cell.textLabel?.text = "8、构造器（类比于指定初始化函数）"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "ViewController")
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 1 {

        } else if indexPath.row == 2 {
            let vc = BJDelegateViewController()
            vc.delegate = self as ClickDelegate
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 3 {
            let vc = BJClassAndInstanceViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 4 {

        } else if indexPath.row == 5 {
            let vc = BJExtensionViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 6 {
            let vc = BJClosureViewController()
            vc.myClosure = {
                (backStr: String) -> Void in
                print(backStr)
            }
            self.navigationController?.pushViewController(vc, animated: true)
        } else if indexPath.row == 7 {
            let vc = BJConstructorViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    //MARK: -
    func click() {
        print("收到代理事件")
    }
}


