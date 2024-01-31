//
//  Model.swift
//  ModularPredictor
//
//  Created by Robert Bates on 1/31/24.
//

import Foundation

struct Variable {
    var title: String
    var value: InputValue
    
    enum InputValue {
        case boolean(Bool)
        case double(Double)
        case picker([String])
    }
}

struct Prediction {
    var value: OutputValue
    
    enum OutputValue {
        case boolean(Bool)
        case double(Double)
    }
}

struct Item {
    var variables = [Variable]()
    var prediction: Int?
}
