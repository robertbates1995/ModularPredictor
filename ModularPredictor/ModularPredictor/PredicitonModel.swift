//
//  Model.swift
//  ModularPredictor
//
//  Created by Robert Bates on 1/31/24.
//

import Foundation

struct Variable: Equatable {
    var title: String
    var value: Bool
}

struct PredictionModel {
    var variables = [Variable]()
    var prediction: Bool
    
    mutating func updatePrediction() -> Bool {
        var numerator = 0.0
        var denominator = 0.0
        for i in variables {
            if i.value == true { numerator += 1 }
            denominator += 1
        }
        let result = numerator / denominator
        return result > 0.5
    }
}
