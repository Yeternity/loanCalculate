//
//  ViewController.swift
//  loanCalculate
//
//  Created by seirra on 2017/4/2.
//  Copyright © 2017年 seirra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loanAmountField: UITextField!
    @IBOutlet weak var loanTermField: UITextField!
    @IBOutlet weak var interestRateField: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBAction func simpleButton(_ sender: Any) {
        //实例化
        let calculate1 = simpleCalculate()
        //！表示强制解析，有可能为nil
        guard let loanTermField = loanTermField.text, let loanAmountField = loanAmountField.text, let interestRateField = interestRateField.text
            else{
                return
        }
        guard let loanTerm = Int(loanTermField), let loanAmount = Double(loanAmountField), let interestRate = Double(interestRateField) else {
            print("format error")
            return
        }
        result.text = calculate1.calculate(loanAmount: loanAmount, years: loanTerm, interestRate: interestRate).money
        //result.text = calculate1.calculate(loanAmount: Double(loanAmountField.text!)!, years:Int(loanTermField.text!)!, interestRate: Double(interestRateField.text!)!).money
    }
    @IBAction func compoundButton(_ sender: Any) {
        let calculate2 = compoundCalculate()
        result.text = calculate2.calculate(loanAmount: Double(loanAmountField.text!)!, years: Int(loanTermField.text!)!, interestRate: Double(interestRateField.text!)!).description
    }
    
    // shift + command + 0 调出官方参考文档
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        loanAmountField.resignFirstResponder()
        loanTermField.resignFirstResponder()
        interestRateField.resignFirstResponder()
    }
    //MARK:视图加载完成
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //MARK:接到内存警告
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class simpleCalculate{
    func calculate(loanAmount:Double, years:Int, interestRate:Double) -> Double{
        let rate = interestRate / 100
        let interest = loanAmount * rate * Double(years)
        return loanAmount + interest
    }
}

class compoundCalculate{
    func calculate(loanAmount: Double, years: Int, interestRate: Double) -> Double{
        let rate = interestRate / 100
        let interest = pow(1.0+rate, Double(years))
        return loanAmount * interest
    }
}

//extension 扩展，可以扩展功能，扩展对象包括class, enum, struct
extension Double{
    var money: String{
        // 3.0之前很多带NS前缀的函数，在3.0中都去掉了
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        //定义一个可选类型 ？ ，表明它可以为nil
        let result: String?
        result = formatter.string(from: NSNumber(value:self))
        if result == nil{
            return "format error"
        }
        return result!
    }
}

//command + shift + K 调出或隐藏键盘
//option(alt) + click 查看元素介绍
//command(win) + click 查看源码
