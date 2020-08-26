//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Felipe Chun on 8/26/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result = "0.0"
    var tip = 10
    var splitBy = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        totalLabel.text = result
        settingsLabel.text = "Split between \(splitBy) people, with \(tip)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
