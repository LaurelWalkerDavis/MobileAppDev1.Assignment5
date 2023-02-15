//
//  CurrencyLogic.swift
//  CurrencyConverter
//
//  Created by Laurel Walker Davis on 2/14/23.
//

import Foundation


struct CurrencyLogic {
    // variables
    var dollars : NSNumber?
    var dollarFloat : Float?
    var canadaSwitch = false
    var sterlingSwitch = false
    var euroSwitch = false
    var yenSwitch = false
    var errorMessage : String = "Amount must contain only whole numbers with no decimals or commas."
    
    
/////////////       GETTERS         ///////////////////
    func getErrorMessage() -> String {
        return errorMessage
    }
    
    func getCanadaSwitch() -> Bool {
        return canadaSwitch
    }
    
    func getSterlingSwitch() -> Bool {
        return sterlingSwitch
    }
    
    func getEuroSwitch() -> Bool {
        return euroSwitch
    }
    
    func getYenSwitch() -> Bool {
        return yenSwitch
    }

/// FORMATS a string to the appropriate currency format
    func getFormatter(_currency: String) -> NumberFormatter {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        
        switch _currency {
        case "USD":
            currencyFormatter.currencyCode = "USD"
        case "CAD":
            currencyFormatter.currencyCode = "CAD"
        case "GBP":
            currencyFormatter.currencyCode = "GBP"
        case "EUR":
            currencyFormatter.currencyCode = "EUR"
        case "JPY":
            currencyFormatter.currencyCode = "JPY"
        default:
            currencyFormatter.currencyCode = "USD"
        }
        return currencyFormatter
    }
    
/// VALIDATES input to ensure the string contains only integer values
    func validInput(_ value : String) -> Bool {
        let set = CharacterSet(charactersIn: value)
        if !CharacterSet.decimalDigits.isSuperset(of: set) {
            return false
        }
        return true
    }
    
/////////////       SETTERS         ///////////////////
    mutating func setAmount(_ amount : String){
        let amountInt = Int(amount)
        dollars = NSNumber(value: amountInt!)
        dollarFloat = dollars?.floatValue
    }
    
    mutating func setCanadaSwitch(_ switchValue: Bool) {
        if switchValue {
            canadaSwitch = true
        }
        else {
            canadaSwitch = false
        }
    }
    
    mutating func setSterlingSwitch(_ switchValue: Bool) {
        if switchValue {
            sterlingSwitch = true
        }
        else {
            sterlingSwitch = false
        }
    }
    
    mutating func setEuroSwitch(_ switchValue: Bool) {
        if switchValue {
            euroSwitch = true
        }
        else {
            euroSwitch = false
        }
    }
    
    mutating func setYenSwitch(_ switchValue: Bool) {
        if switchValue {
            yenSwitch = true
        }
        else {
            yenSwitch = false
        }
    }

    
/////////////       CALCULATIONS AND FORMATTING         ///////////////////
    // Formats dollar string to USD currency
    mutating func getDollarFormat(_ amount : String) -> String {
        let format = getFormatter(_currency: "USD")
        let usdString = format.string(from: dollars!)
        return usdString!
    }
    
    // Calculates and formats dollar amount string into canadian dollars
    mutating func calculateCanada(_amount: String) -> String {
        let format = getFormatter(_currency: "CAD")
        let cadDollarFloat = Float(1.3403) * dollarFloat!
        let cadNum = NSNumber(value: cadDollarFloat)
        let canadaString = format.string(from: cadNum)
        return canadaString!
    }
    
    // Calculates and formats dollar amount string into pounds
    mutating func calculateSterling(_amount: String) -> String {
        let format = getFormatter(_currency: "GBP")
        let sterlingFloat = Float(0.8330) * dollarFloat!
        let sterlingNum = NSNumber(value: sterlingFloat)
        let sterlingString = format.string(from: sterlingNum)
        return sterlingString!
    }
    
    // Calculates and formats dollar amount string into euros
    mutating func calculateEuro(_amount: String) -> String {
        let format = getFormatter(_currency: "EUR")
        let euroFloat = Float(0.9372) * dollarFloat!
        let euroNum = NSNumber(value: euroFloat)
        let euroString = format.string(from: euroNum)
        return euroString!
    }
    
    // Calculates and formats dollar amount string into yen
    mutating func calculateYen(_amount: String) -> String {
        let format = getFormatter(_currency: "JPY")
        let yenFloat = Float(134.2935) * dollarFloat!
        let yenNum = NSNumber(value: yenFloat)
        let yenString = format.string(from: yenNum)
        return yenString!
    }
    
    
    
    
    
    
    
}
