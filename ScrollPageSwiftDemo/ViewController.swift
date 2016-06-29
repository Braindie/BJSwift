//
//  ViewController.swift
//  ScrollPageSwiftDemo
//
//  Created by zhangwenjun on 16/6/28.
//  Copyright © 2016年 zcgt_ios_01. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    

    
    @IBOutlet weak var mainLabel: UILabel!
    
    var logic : CalcLogic!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mainLabel.text = "0"
        logic = CalcLogic()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        logic = nil
    }
    
    
    
    
    //数字按钮
    @IBAction func numberButtonPressed(sender: AnyObject) {
        
        var btn : UIButton = sender as! UIButton
        //刷新label的值
        mainLabel.text = logic.updateMainLabelStringByNumberTag(btn.tag, withmainlabelString: mainLabel.text!)
    }

    //小数点按钮
    @IBAction func decimalPressed(sender: AnyObject) {
        if logic.doesStringContainDecimal(mainLabel.text!) == false {
            let string = mainLabel.text! + "."
            
            mainLabel.text = string
        }
        
    }
    
    //清除按钮
    @IBAction func clearPressed(sender: AnyObject) {
        
        mainLabel.text = "0"
        logic.clear()
    }
    
    //等于按钮
    @IBAction func eqalsPressed(sender: AnyObject) {
        
        var btn : UIButton = sender as! UIButton
        
        mainLabel.text = logic.calculateByTag(btn.tag, withmainlabelString: mainLabel.text!)
        
    }
    
    //运算符按钮
    @IBAction func operandPressed(sender: AnyObject) {
        
        var btn : UIButton = sender as! UIButton
        
        mainLabel.text = logic.calculateByTag(btn.tag, withmainlabelString: mainLabel.text!)
        
    }

}

