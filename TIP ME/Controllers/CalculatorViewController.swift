//
//  ViewController.swift
//  TIP ME
//
//  Created by Владимир Коваленко on 20.03.2020.
//  Copyright © 2020 Vladimir Kovalenko. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

   
    @IBOutlet weak var text12: UITextField!
    @IBOutlet weak var tenPntButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPntButton: UIButton!
    @IBOutlet weak var zeroPntButton: UIButton!
   
    var tipValue = 0.10
    var persons = 2
    var billValue = 0.0
    var resultTo2DecimalPlaces  = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        text12.endEditing(true)
        
      zeroPntButton.isSelected = false
        tenPntButton.isSelected = false
        twentyPntButton.isSelected = false
        
        sender.isSelected = true
        let buttonValue = sender.currentTitle!
        let buttonValueMinusPerc = String(buttonValue.dropLast())
        let buttonValuewMinusPercDoble = Double(buttonValueMinusPerc)!
        tipValue = buttonValuewMinusPercDoble/100
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        persons = Int(sender.value)
        
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = text12.text!
        if bill != "" {
            billValue = Double(bill)!
            let result = billValue * (1 + tipValue) / Double(persons)
          resultTo2DecimalPlaces = String(format: "%.2f", result)
        }
        
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                   if segue.identifier == "goToResult" {
                    let destinationVC = segue.destination as! ResultViewController
                    destinationVC.billVlaue = resultTo2DecimalPlaces
                    destinationVC.persons = persons
                    destinationVC.tip = Int(tipValue * 100)
           
        }
    }
}



