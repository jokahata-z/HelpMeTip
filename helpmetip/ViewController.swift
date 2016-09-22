//
//  ViewController.swift
//  helpmetip
//
//  Created by John Okahata on 9/20/16.
//  Copyright © 2016 John Okahata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tipCalculatorView: UIView!
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tip1Label: UILabel!
    @IBOutlet weak var tip2Label: UILabel!
    @IBOutlet weak var tip3Label: UILabel!
    
    @IBOutlet weak var tip1AmountLabel: UILabel!
    @IBOutlet weak var tip2AmountLabel: UILabel!
    @IBOutlet weak var tip3AmountLabel: UILabel!
    
    @IBOutlet weak var total1Label: UILabel!
    @IBOutlet weak var total2Label: UILabel!
    @IBOutlet weak var total3Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billField.becomeFirstResponder()
        let defaults = UserDefaults.standard
        let defaultTip1 = defaults.integer(forKey: "default_tip_1")
        let defaultTip2 = defaults.integer(forKey: "default_tip_2")
        let defaultTip3 = defaults.integer(forKey: "default_tip_3")
        calculateTip (self)
        
        tip1Label.text = String(format: "%d%%", defaultTip1)
        tip2Label.text = String(format: "%d%%", defaultTip2)
        tip3Label.text = String(format: "%d%%", defaultTip3)
        
        UIView.animate(withDuration: 0.4, animations: {
            self.tipCalculatorView.alpha = 1
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIView.animate(withDuration: 0.4, animations: {
            self.tipCalculatorView.alpha = 0
        })
    }


    @IBAction func calculateTip(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        let defaultTip1 = Double(defaults.integer(forKey: "default_tip_1")) / 100.0
        let defaultTip2 = Double(defaults.integer(forKey: "default_tip_2")) / 100.0
        let defaultTip3 = Double(defaults.integer(forKey: "default_tip_3")) / 100.0
        
        let tipPercentages = [defaultTip1, defaultTip2, defaultTip3]
        
        let bill = Double(billField.text!) ?? 0
        let tip1 = bill * tipPercentages[0]
        let tip2 = bill * tipPercentages[1]
        let tip3 = bill * tipPercentages[2]
        
        let total1 = bill + tip1
        let total2 = bill + tip2
        let total3 = bill + tip3
        
        tip1AmountLabel.text = String(format: "$%.2f", tip1)
        total1Label.text = String(format: "$%.2f", total1)
        
        tip2AmountLabel.text = String(format: "$%.2f", tip2)
        total2Label.text = String(format: "$%.2f", total2)
        
        tip3AmountLabel.text = String(format: "$%.2f", tip3)
        total3Label.text = String(format: "$%.2f", total3)
    }
}

