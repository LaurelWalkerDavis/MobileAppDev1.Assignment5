//
//  ConversionViewController.swift
//  CurrencyConverter
//
//  Created by Laurel Walker Davis on 2/14/23.
//

import UIKit

class ConversionViewController: UIViewController {
 
    // AMOUNT labels
    @IBOutlet weak var usdAmountLabel: UILabel!
    
    @IBOutlet weak var canadaAmountLabel: UILabel!
    
    @IBOutlet weak var euroAmountLabel: UILabel!
    
    @IBOutlet weak var sterlingAmountLabel: UILabel!
    
    @IBOutlet weak var yenAmountLabel: UILabel!
    
    // CURRENCY labels
    @IBOutlet weak var canadaLabel: UILabel!
    
    @IBOutlet weak var euroLabel: UILabel!
    
    @IBOutlet weak var sterlingLabel: UILabel!
    
    @IBOutlet weak var yenLabel: UILabel!
    
    
    // VARIABLES
    var logic = CurrencyLogic() // link to CurrencyLogic
    
    var usdAmount : String = ""
    var canadaSwitch : Bool?
    var euroSwitch : Bool?
    var sterlingSwitch : Bool?
    var yenSwitch : Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logic.setAmount(usdAmount)
        usdAmountLabel.text = "USD Amount: \(logic.getDollarFormat(usdAmount))"

        
///// CANADA /////////
        if (canadaSwitch!) {
            canadaAmountLabel.isHidden = false
            canadaAmountLabel.text = logic.calculateCanada(_amount: usdAmount)
        }
        else {
            canadaLabel.isHidden = true
            canadaAmountLabel.isHidden = true
        }
        
///// EURO /////////
        if (euroSwitch!) {
            euroAmountLabel.isHidden = false
            euroAmountLabel.text = logic.calculateEuro(_amount: usdAmount)
        }
        else {
            euroLabel.isHidden = true
            euroAmountLabel.isHidden = true
        }

///// STERLING /////////
        if (sterlingSwitch!) {
            sterlingAmountLabel.isHidden = false
            sterlingAmountLabel.text = logic.calculateSterling(_amount: usdAmount)
        }
        else {
            sterlingLabel.isHidden = true
            sterlingAmountLabel.isHidden = true
        }
///// YEN /////////
        if (yenSwitch!) {
            yenAmountLabel.isHidden = false
            yenAmountLabel.text = logic.calculateYen(_amount: usdAmount)
        }
        else {
            yenLabel.isHidden = true
            yenAmountLabel.isHidden = true
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
