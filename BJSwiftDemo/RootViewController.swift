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
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3;
    }

    //MARK: - delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2;
        } else if section == 1 {
            return 7;
        } else if section == 2 {
            return 8;
        } else {
            return 0;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "算法"
            } else if indexPath.row == 1 {
                cell.textLabel?.text = "计算器"
            }
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "多态（同OC）"
            } else if indexPath.row == 1 {
                cell.textLabel?.text = "扩展（Swift没有分类了）"
            } else if indexPath.row == 2 {
                cell.textLabel?.text = "KVC（静态语言，通过NSObject实现）"
            } else if indexPath.row == 3 {
                cell.textLabel?.text = "0.0"
            } else if indexPath.row == 4 {
                cell.textLabel?.text = "构造器（类比于指定初始化函数）"
            } else if indexPath.row == 5 {
                cell.textLabel?.text = "类方法与实例方法"
            } else if indexPath.row == 6 {
                cell.textLabel?.text = "泛型"
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "代理"
            } else if indexPath.row == 1 {
                cell.textLabel?.text = "闭包（类比Block）"
            } else if indexPath.row == 2 {
                cell.textLabel?.text = "通知"
            } else if indexPath.row == 3 {
                cell.textLabel?.text = "KVO（OC特性，通过NSObject实现）"
            }
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let vc = BJArithmeticViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 1 {
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let vc = sb.instantiateViewController(withIdentifier: "ViewController")
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {

            } else if indexPath.row == 1 {
                let vc = BJExtensionViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 2 {
                let alert = UIAlertController.init(title: "提示", message: "通过OC的动态特性来实现", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction.init(title: "取消", style: UIAlertAction.Style.cancel, handler: nil))
                self.navigationController?.present(alert, animated: true, completion: nil)
                
            } else if indexPath.row == 3 {
                let alert = UIAlertController.init(title: "提示", message: "占位的", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction.init(title: "取消", style: UIAlertAction.Style.cancel, handler: nil))
                self.navigationController?.present(alert, animated: true, completion: nil)
                
            } else if indexPath.row == 4 {
                let vc = BJConstructorViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 5 {
                let vc = BJClassAndInstanceViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 6 {
                let vc = BJGenericsViewController()
                self.navigationController?.pushViewController(vc, animated: true)

            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                let vc = BJDelegateViewController()
                vc.delegate = self as ClickDelegate
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 1 {
                let vc = BJClosureViewController()
                vc.myClosure = {
                    (backStr: String) -> Void in
                    print(backStr)
                }
                self.navigationController?.pushViewController(vc, animated: true)
            } else if indexPath.row == 2 {
                let alert = UIAlertController.init(title: "提示", message: "太常见了，没写", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction.init(title: "取消", style: UIAlertAction.Style.cancel, handler: nil))
                self.navigationController?.present(alert, animated: true, completion: nil)
                
            } else if indexPath.row == 3 {
                let vc = BJKVOViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80;
    }
    
    //MARK: -
    func click() {
        print("收到代理事件")
    }
}


