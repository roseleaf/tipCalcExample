//
//  ViewController.swift
//  tips
//
//  Created by Rose Trujillo on 1/28/15.
//  Copyright (c) 2015 Rose Trujillo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalField: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var tipPercentages: [Int]!
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        totalField.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var billAmount = NSString(string: billField.text).doubleValue
        var tipPercentages = [0.15, 0.18, 0.20]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        var tip = billAmount * tipPercentage 
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalField.text = String(format: "$%.2f", total)    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = NSUserDefaults.standardUserDefaults()
        let percentSetting = defaults.integerForKey("tip_percent")
        
        tipControl.selectedSegmentIndex = percentSetting
        
        self.onEditingChanged(self)
    }
}

