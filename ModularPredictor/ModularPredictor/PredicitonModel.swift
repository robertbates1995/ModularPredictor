//
//  Model.swift
//  ModularPredictor
//
//  Created by Robert Bates on 1/31/24.
//

import Foundation

struct Variable: Equatable {
    var title: String
    var value: InputValue
    
    enum InputValue: Equatable {
        case trueFalse(Bool)
        case number(Double)
        case picker([String])
    }
}

enum Prediction: Equatable {
    case trueFalse(Bool)
    case number(Double)
}

struct PredictionModel {
    var variables = [Variable]()
    var prediction: Prediction?
    
    mutating func updatePrediction() {
        prediction = variables.reduce(nil) {
            switch $1.value {
            case .trueFalse(let value):
                return .trueFalse(value)
            case .number(let value):
                return .number(value)
            case .picker(let value):
                return $0
            }
        }
    }
}
