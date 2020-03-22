//
//  ResultViewController.swift
//  TIP ME
//
//  Created by Владимир Коваленко on 20.03.2020.
//  Copyright © 2020 Vladimir Kovalenko. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var splitBtwnPeopleLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var billVlaue = "0.0"
    var persons = 2
    var tip = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = billVlaue
        splitBtwnPeopleLabel.text = "Split between \(persons) people, with \(tip)% tip."
    }
    

    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
         self.dismiss(animated: true, completion: nil)
    }
   

}
