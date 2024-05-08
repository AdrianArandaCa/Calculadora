//
//  Model.swift
//  Calculadora
//
//  Created by Dev on 22/10/23.
//

import Foundation
import SwiftUI

struct KeyBoardButton: Hashable {
    let title: String
    let textColor: Color
    let backgroundColor: Color
    let isDoubleWidth: Bool
    let type: ButtonType
}

enum ButtonType: Hashable {
    case number(Int)
    case operation(OperationType)
    case result
    case reset
}

enum OperationType: Hashable {
    case sum
    case multiplication
    case rest
    case divisor
}
