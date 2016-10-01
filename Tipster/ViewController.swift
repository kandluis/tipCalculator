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
    var taxRate: Double? = nil

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipDisplay: UILabel!
    @IBOutlet weak var tipStepper: UIStepper!
    @IBOutlet weak var settingButton: UIBarButtonItem!
    @IBOutlet weak var calculatorNavigation: UINavigationItem!
    
    // Format string from percentage tip.
    func formatPercent(tip: Double) -> String{
        return String(format: "%.2f%%", tip * 100)
    }
    
    func updateUI() -> (){
        let percent = self.percent ?? 0.15
        let step = self.stepSize ?? 0.05
        
        tipStepper.stepValue = step
        tipStepper.value = percent
        tipSlider.value = Float(percent)
        tipDisplay.text = self.formatPercent(percent)
    }
    
    func formatBillField(input: Double) -> String {
        return String(format: "$%.2f", input)
    }

    // Lifecycle Actions.
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Load default values from storage. 
        let defaults = NSUserDefaults.standardUserDefaults()
        self.percent = defaults.doubleForKey("percent")
        self.stepSize = defaults.doubleForKey("stepSize")
        self.taxRate = defaults.doubleForKey("taxRate")
        
        self.updateUI()
    }
    
    @IBAction func billAmountChanged(sender: AnyObject) {
        billField.text = self.formatBillField(Double(billField.text!) ?? 0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // store original default values
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(0.15, forKey: "percent")
        defaults.setDouble(0.05, forKey: "stepSize")
        defaults.setDouble(0.0, forKey: "taxRate")
        
        // Set Unicode code for buttons
        settingButton.title = "\u{2699}"
        calculatorNavigation.title = "Tip \u{2605}"
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
        let tax = bill * self.taxRate!
        let total = bill + tip + tax
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func updateTipPercentage(sender: AnyObject) {
        let tipSliderValue = Double(Int((Double(tipSlider.value) / self.stepSize!))) * self.stepSize!
        // slider changed in value
        if tipSliderValue != self.percent {
            self.percent = tipSliderValue
            tipStepper.value = tipSliderValue
        }
        // stepper changed
        else if tipStepper.value != self.percent {
            self.percent = tipStepper.value
            tipSlider.value = Float(self.percent! + 0.005)
        }
        
        tipDisplay.text = self.formatPercent(self.percent ?? 0.15)
        
        // Recalculate tip.
        calculateTip(sender)
    }
}

