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
        self.title = "Swift"
      
        self.myTableView.delegate = self;
        self.myTableView.dataSource = self;
    }
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6;
    }

    //MARK: - delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2;
        } else if section == 1 {
            return 4;
        } else if section == 2 {
            return 3;
        } else if section == 3 {
            return 3
        } else {
            return 1;
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
                cell.textLabel?.text = "代理"
            } else if indexPath.row == 1 {
                cell.textLabel?.text = "闭包（类比Block）"
            } else if indexPath.row == 2 {
                cell.textLabel?.text = "通知"
            } else if indexPath.row == 3 {
                cell.textLabel?.text = "KVO（OC特性，通过NSObject实现）"
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                cell.textLabel?.text = "多态（同OC）"
            } else if indexPath.row == 1 {
                cell.textLabel?.text = "扩展（Swift没有分类了）"
            } else if indexPath.row == 2 {
                cell.textLabel?.text = "KVC（静态语言，通过NSObject实现）"
            }
        } else if indexPath.section == 3 {
            if indexPath.row == 0 {
               cell.textLabel?.text = "构造器（类比于指定初始化函数）"
            } else if indexPath.row == 1 {
               cell.textLabel?.text = "类方法与实例方法"
            } else if indexPath.row == 2 {
               cell.textLabel?.text = "泛型"
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
                let alert = UIAlertController.init(title: "提示", message: "和OC差不多，没写", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction.init(title: "取消", style: UIAlertAction.Style.cancel, handler: nil))
                self.navigationController?.present(alert, animated: true, completion: nil)
                
            } else if indexPath.row == 3 {
                let vc = BJKVOViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                
            } else if indexPath.row == 1 {
                let vc = BJExtensionViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 2 {
                let alert = UIAlertController.init(title: "提示", message: "通过OC的动态特性来实现", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction.init(title: "取消", style: UIAlertAction.Style.cancel, handler: nil))
                self.navigationController?.present(alert, animated: true, completion: nil)
                
            }
        } else if indexPath.section == 3 {
            if indexPath.row == 0 {
                let vc = BJConstructorViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 1 {
                let vc = BJClassAndInstanceViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                
            } else if indexPath.row == 2 {
                let vc = BJGenericsViewController()
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: UIView = UIView()
        headerView.frame = CGRect.init(x: 0, y: 0, width: 300, height: 50)
        headerView.backgroundColor = UIColor.groupTableViewBackground
        let headerLabel: UILabel = UILabel.init(frame: CGRect.init(x: 15, y: 10, width: 250, height: 40))
        headerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerView.addSubview(headerLabel)
        
        switch section {
        case 0:
            headerLabel.text = "算法"
        case 1:
            headerLabel.text = "通信方式"
        case 2:
            headerLabel.text = "一般语法"
        case 3:
            headerLabel.text = "重要语法"
        case 4:
            headerLabel.text = "Memory"
        case 5:
            headerLabel.text = "MutipleThread"
        default:
            headerLabel.text = ""
        }
        
        return headerView
    }
    
    //MARK: -
    func click() {
        print("收到代理事件")
    }
}


