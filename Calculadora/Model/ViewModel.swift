//
//  ViewModel.swift
//  Calculadora
//
//  Created by Dev on 22/10/23.
//

import Foundation

final class ViewModel: ObservableObject {
    @Published var textFieldValue: String = ""
    
    var textFieldSavedValue: String = "0"
    var currentOperationToExecute: OperationType?
    var shouldRunOperation: Bool = false
    
    func logic (key: KeyBoardButton) {
        switch key.type {
        case .number(let value):
            if shouldRunOperation {
                textFieldValue = "0"
            }
            textFieldValue = textFieldValue == "0" ? "\(value)" : textFieldValue + "\(value)"
        case .reset:
            textFieldValue = "0"
            textFieldSavedValue = "0"
            currentOperationToExecute = nil
            shouldRunOperation = false
        case .result:
            guard let operation = currentOperationToExecute else {
                return
            }
            
            switch operation {
            case .multiplication:
                textFieldValue = "\(Int(textFieldValue)! * Int(textFieldSavedValue)!)"
            case .divisor:
                textFieldValue = Int(textFieldSavedValue) != 0 ? "\(Int(textFieldValue)! / Int(textFieldSavedValue)!)" : "\(Int(0))"
            case .rest:
                textFieldValue = "\(Int(textFieldValue)! - Int(textFieldSavedValue)!)"
            case .sum:
                textFieldValue = "\(Int(textFieldValue)! + Int(textFieldSavedValue)!)"
            
            }
        case .operation(let type):
            textFieldSavedValue = textFieldValue
            currentOperationToExecute = type
            shouldRunOperation = true
        }
    }
}
