//
//  SettingsTableViewController.swift
//  Tipster
//
//  Created by Luis Perez on 9/30/16.
//  Copyright © 2016 Luis Perez. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    // Sections
    let sectionRows = [1, 2, 1]
    
    // For tax purposes (TODO: dynamically populate)
    let locationData = ["Cupertino", "Nacogdoches", "Cambridge"]
    let taxData = [0.0625, 0.0825, 0.05]
    
    // Text for default tip selected
    @IBOutlet weak var tipText: UITextField!
    
    // Text for default step size.
    @IBOutlet weak var tipStepText: UITextField!
    
    // Navigation title
    @IBOutlet weak var settingsNavigation: UINavigationItem!
    
    // UIPicker for location (for tax calculation)
    @IBOutlet weak var locationPicker: UISegmentedControl!

    // Section 1 of Table
    @IBOutlet weak var copyRightLabel: UILabel!
    
    // Switch for tax purposes!
    @IBOutlet weak var taxSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gestureRecognizer = UITapGestureRecognizer.init(target: self, action:#selector(SettingsTableViewController.loseFocus(_:)))
        self.tableView.addGestureRecognizer(gestureRecognizer)
        
        // UI Improvements
        settingsNavigation.title = "Settings \u{2699}"
        copyRightLabel.text = "Luis A. Perez \u{00A9} 2016"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let stepSize = defaults.double(forKey: "stepSize")
        let percent = defaults.double(forKey: "percent")
        let taxRow = defaults.integer(forKey: "taxRow")
        let turnedOn = defaults.bool(forKey: "switch")
        
        // Update with what we know
        tipStepText.text = String(format: "%d", Int(stepSize * 100))
        tipText.text = String(format: "%.2f", percent)
        taxSwitch.setOn(turnedOn, animated: true)
        locationPicker.selectedSegmentIndex = taxRow ?? 0;
    }
    
    func loseFocus(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    func calcTax(_ taxRate: Double) -> () {
        let defaults = UserDefaults.standard
        defaults.set(taxRate, forKey: "taxRate")
    }
    
    @IBAction func switchChange(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(taxSwitch.isOn, forKey: "switch")
        self.locationChange(sender)
    }
    
    @IBAction func updateStepSize(_ sender: AnyObject) {
        let step = (Double(tipStepText.text!) ?? 5.0) / 100
        let defaults = UserDefaults.standard
        defaults.set(step, forKey: "stepSize")
    }
    
    @IBAction func updateTip(_ sender: AnyObject) {
        let tip = Double(tipText.text!) ?? 0.15
    let defaults = UserDefaults.standard
        defaults.set(tip, forKey: "percent")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sectionRows[section]
    }
    
    @IBAction func locationChange(_ sender: AnyObject) {
        let row = locationPicker.selectedSegmentIndex

        // Save settings
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: "taxRow")
        
        // Calculate the tax rate if tax is turned on
        if taxSwitch.isOn {
            self.calcTax(taxData[row])
        }
        else {
            self.calcTax(0.0)
        }
        
    }
}
