//
//  BJDelegateViewController.swift
//  BJSwiftDemo
//
//  Created by zhangwenjun on 2019/6/18.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import UIKit


class BJDelegateViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        
        let btn: UIButton = UIButton.init(type: UIButton.ButtonType.custom)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 30)
        btn.setTitle("跳转", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        
        btn.addTarget(self, action: #selector(btnAction(button:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(btn)
        
    }
    
    @objc func btnAction(button:UIButton) {
        
        let vc: BJDelegateSecondVC = BJDelegateSecondVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
