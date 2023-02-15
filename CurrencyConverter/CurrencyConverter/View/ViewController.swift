//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Laurel Walker Davis on 2/14/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!

    @IBOutlet weak var usdGivenInput: UITextField!

// VARIABLES
    
    var logic = CurrencyLogic()
    
    var delegate: UITextFieldDelegate?
    
    var yen : Bool?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
    }

    @IBAction func canadaSwitch(_ sender: UISwitch) {
        logic.setCanadaSwitch(sender.isOn)
    }
    
    @IBAction func euroSwitch(_ sender: UISwitch) {
        logic.setEuroSwitch(sender.isOn)
    }
    
    @IBAction func sterlingSwitch(_ sender: UISwitch) {
        logic.setSterlingSwitch(sender.isOn)
    }
    
    @IBAction func yenSwitch(_ sender: UISwitch) {
        logic.setYenSwitch(sender.isOn)
    }
    
    @IBAction func convert(_ sender: UIButton) {
        if (logic.validInput(usdGivenInput.text!)) {
            self.performSegue(withIdentifier: "toConvertedAmount", sender: self)
            errorLabel.isHidden = true
        }
        else {
            errorLabel.text = logic.getErrorMessage()
            errorLabel.isHidden = false
        }
    }
        
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected objects to the ConversionViewController using methods in CurrencyLogic
        
        if segue.identifier == "toConvertedAmount" {
            let convertNavigation = segue.destination as! ConversionViewController
            convertNavigation.usdAmount = usdGivenInput!.text!
            convertNavigation.canadaSwitch = logic.getCanadaSwitch()
            convertNavigation.euroSwitch = logic.getEuroSwitch()
            convertNavigation.sterlingSwitch = logic.getSterlingSwitch()
            convertNavigation.yenSwitch = logic.getYenSwitch()
        }
    }
}

