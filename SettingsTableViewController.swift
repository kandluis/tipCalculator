//
//  SettingsTableViewController.swift
//  Tipster
//
//  Created by Luis Perez on 9/30/16.
//  Copyright © 2016 Luis Perez. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    let sectionRows = [1, 2, 1]
    
    @IBOutlet weak var tipStepText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let stepSize = defaults.doubleForKey("stepSize")
        tipStepText.text = String(format:"%d", Int(stepSize * 100))
    }
    
    @IBAction func loseFocus(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func updateStepSize(sender: AnyObject) {
        let step = Double(tipStepText.text!) ?? 0.05
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(step, forKey: "stepSize")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sectionRows[section]
    }
}
