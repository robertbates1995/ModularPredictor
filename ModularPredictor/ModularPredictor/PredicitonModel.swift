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
        case boolean(Bool)
        case double(Double)
        case picker([String])
    }
}

struct Prediction: Equatable {
    var value: OutputValue
    
    enum OutputValue: Equatable {
        case boolean(Bool)
        case double(Double)
    }
}

struct PredictionModel {
    var variables = [Variable]()
    var prediction: Prediction?
}
