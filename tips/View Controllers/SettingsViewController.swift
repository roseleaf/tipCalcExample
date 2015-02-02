//
//  SettingsViewController.swift
//  tips
//
//  Created by Rose Trujillo on 2/2/15.
//  Copyright (c) 2015 Rose Trujillo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipPercentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onTipPercentageChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let index = tipPercentControl.selectedSegmentIndex
        
        defaults.setInteger(index, forKey: "tip_percent")
        defaults.synchronize()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
