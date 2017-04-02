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
        result.text = calculate1.calculate(loanAmount: Double(loanAmountField.text!)!, years:Int(loanTermField.text!)!, interestRate: Double(interestRateField.text!)!).description
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
