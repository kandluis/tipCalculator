//
//  ViewController.swift
//  Tipster
//
//  Created by Luis Perez on 9/29/16.
//  Copyright © 2016 Luis Perez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipDisplay: UILabel!
    @IBOutlet weak var tipStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loseFocus(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        let bill = Double(billField.text!) ?? 0
        let tip = bill * Double(tipSlider.value)
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func updateTipPercentage(sender: AnyObject) {
        let percent = 100 * tipSlider.value
        tipDisplay.text = String(format: "%.2f%%", percent)
    }
    
    @IBAction func updateTipSlider(sender: AnyObject) {
        tipSlider.value = Float(tipStepper.value)
        updateTipPercentage(sender)
        calculateTip(sender)
    }
    
    // Lifecycle Actions.
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

}

