//
//  SettingsViewController.swift
//  helpmetip
//
//  Created by John Okahata on 9/20/16.
//  Copyright © 2016 John Okahata. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTip1Field: UITextField!
    @IBOutlet weak var defaultTip2Field: UITextField!
    @IBOutlet weak var defaultTip3Field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let defaultTip1 = defaults.integer(forKey: "default_tip_1")
        let defaultTip2 = defaults.integer(forKey: "default_tip_2")
        let defaultTip3 = defaults.integer(forKey: "default_tip_3")
        
        defaultTip1Field.text = String(format: "%d%", defaultTip1)
        defaultTip2Field.text = String(format: "%d%", defaultTip2)
        defaultTip3Field.text = String(format: "%d%", defaultTip3)
    }
    
    @IBAction func onDefaultTipChange(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        let tip1 = Int(defaultTip1Field.text!) ?? 0
        let tip2 = Int(defaultTip2Field.text!) ?? 0
        let tip3 = Int(defaultTip3Field.text!) ?? 0
        defaults.set(tip1, forKey: "default_tip_1")
        defaults.set(tip2, forKey: "default_tip_2")
        defaults.set(tip3, forKey: "default_tip_3")
        defaults.synchronize ()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
