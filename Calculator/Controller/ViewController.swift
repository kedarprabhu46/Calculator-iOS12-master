//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    var finishTypingNum:Bool=true
    
    var displayValue:Double{
        get{
            guard let value=Double(displayLabel.text!) else {fatalError("Error converting")}
            return value
        }
        
        set{
            //print("newValue \(newValue)")
            //print("newValue.truncatingRemainder(dividingBy: 1) \(newValue.truncatingRemainder(dividingBy: 1))")
            if newValue.truncatingRemainder(dividingBy: 1)==0{
                displayLabel.text=String(Int(floor(newValue)))
            }
            else{
            displayLabel.text=String(newValue)
            }
        }
    }
    
    private var CalcLogic=Calculatorlogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        
        if let operation=sender.currentTitle{
            CalcLogic.setNumber(displayValue)
            if let answer=CalcLogic.OperationToBePerformed(operation: operation){
                displayValue=answer
            }
            finishTypingNum=true
        }
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numPressed=sender.currentTitle{
            if finishTypingNum{
                displayLabel.text=numPressed
                finishTypingNum=false
            }
            else{
                if numPressed=="."{
                    //guard let currentDisplayNum=Double(displayLabel.text!) else {fatalError()}
                    let intNum=floor(displayValue)==displayValue
                    if !intNum{
                        return
                    }
                    
                    
                }
                
            displayLabel.text?.append(numPressed)
            }
        }
    
    }

}

