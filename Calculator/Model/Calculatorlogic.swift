//
//  Calculatorlogic.swift
//  Calculator
//
//  Created by Apple on 07/02/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation


struct Calculatorlogic{
    
    private var number:Double?
    
    private var firstOperandAndOperator:(num1Stored:Double,operationStored:String)?
    
    mutating func setNumber(_ number:Double){
        self.number=number
        print("Number 1 set\(self.number)")
    }
    
    mutating func OperationToBePerformed(operation:String)->Double? {
        if let n1=number{
            print("number set in operationtobeperformed")
            if operation=="+/-"{
                return n1 * -1
            }
            else if operation=="AC"{
               return 0
            }
            else if operation=="%"{
                return n1/100
            }
            else if operation=="="{
                let result=performOperationOnTwoOperands(n2: n1)
                print("result:\(result!)")
                return result
            }
            else{
                //add sub mul div
                print("n1\(n1)")
                print("operation\(operation)")
                firstOperandAndOperator=(num1Stored:n1,operationStored:operation)
                print("firstOperandAndOperator \(firstOperandAndOperator?.num1Stored) \(firstOperandAndOperator?.operationStored)")
                return n1
                }
                
          }
                return nil
          
        }
    
    
   private func performOperationOnTwoOperands(n2:Double)->Double?{
    
    print("#########performOperationOnTwoOperands")
    if let sign=firstOperandAndOperator?.operationStored, let n1=firstOperandAndOperator?.num1Stored{
        switch(sign){
        case "+":return n1+n2
            
        case "-":return n1-n2
        case "x":return n1*n2
        case "÷":return n1/n2
        default:return nil
        }
        print("value present")
    }
    
    return nil
    
    }
    
    
    
    
}
