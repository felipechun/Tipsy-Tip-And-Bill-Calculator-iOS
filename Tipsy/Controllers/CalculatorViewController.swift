

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!


    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        
        let buttonTitleWithoutPercentage = String(buttonTitle.dropLast())
        
        let buttonTitleAsNumber = Double(buttonTitleWithoutPercentage)!
        
        calculatorBrain.tip = buttonTitleAsNumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        calculatorBrain.splitBy = Int(sender.value)
        splitNumberLabel.text = String(calculatorBrain.splitBy)
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        calculatorBrain.calculateBill(bill: bill)
        
        performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResults" {
            
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.result = calculatorBrain.getResult()
            destinationVC.tip = calculatorBrain.getTip()
            destinationVC.splitBy = calculatorBrain.getSplitBy()
        }
    }
}

