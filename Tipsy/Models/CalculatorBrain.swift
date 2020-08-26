//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Felipe Chun on 8/26/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    var finalResult = ""
    var tip = 0.1
    var splitBy = 2
    
    mutating func calculateBill(bill: String) {
        
        if bill != "" {
            
            let billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(splitBy)
            finalResult = String(format: "%.2f", result)
        }
        
    }
    
    func getResult() -> String {
        return finalResult
    }
    
    func getSplitBy() -> Int {
        return splitBy
    }
    
    func getTip() -> Int {
        return Int(tip * 100)
    }
}
