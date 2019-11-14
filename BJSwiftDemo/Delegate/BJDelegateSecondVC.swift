//
//  BJDelegateSecondVC.swift
//  BJSwiftDemo
//
//  Created by zhangwenjun on 2019/11/13.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import Foundation
import UIKit

protocol ModelObjectDelegate: class {
    
}

class ModelObject {
    var delegate: ModelObjectDelegate?
}

class BJDelegateSecondVC: UIViewController, ModelObjectDelegate {
    var modelObject: ModelObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        modelObject = ModelObject()
        modelObject?.delegate = self
        
            
        let btn: UIButton = UIButton.init(type: UIButton.ButtonType.custom)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 30)
        btn.setTitle("返回", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        
        btn.addTarget(self, action: #selector(btnAction(button:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(btn)
            
    }
        
    @objc func btnAction(button:UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
}
