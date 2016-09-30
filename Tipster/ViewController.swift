//
//  ViewController.swift
//  Tipster
//
//  Created by Luis Perez on 9/29/16.
//  Copyright © 2016 Luis Perez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Class variables
    var percent: Double? = nil
    var stepSize: Double? = nil

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipDisplay: UILabel!
    @IBOutlet weak var tipStepper: UIStepper!

    // Lifecycle Actions.
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Load default values from storage. 
        let defaults = NSUserDefaults.standardUserDefaults()
        self.percent = defaults.doubleForKey("percent")
        self.stepSize = defaults.doubleForKey("stepSize")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // store original default values
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(0.15, forKey: "percent")
        defaults.setDouble(0.05, forKey: "stepSize")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // When the text field loses focus, end editing
    // session.
    @IBAction func loseFocus(sender: AnyObject) {
        view.endEditing(true)
    }
    
    // The tip slider is the ab
    @IBAction func calculateTip(sender: AnyObject) {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * self.percent!
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func updateTipPercentage(sender: AnyObject) {
        let tipSliderValue = Double(Int((Double(tipSlider.value) / self.stepSize!))) * self.stepSize!
        // slider overwrites the stepper function if both are changed
        if tipSliderValue != self.percent {
            self.percent = tipSliderValue
            tipStepper.value = tipSliderValue
        }
        if tipStepper.value != self.percent {
            self.percent = tipStepper.value
            tipSlider.value = Float(tipStepper.value)
        }
        
        let percent = 100 * self.percent!
        tipDisplay.text = String(format: "%.2f%%", percent)
        
        // Recalculate tip.
        calculateTip(sender)
    }
}

