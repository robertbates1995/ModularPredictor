//
//  Model.swift
//  ModularPredictor
//
//  Created by Robert Bates on 1/31/24.
//

import Foundation

struct Variable: Equatable {
    var title: String
    var value: Double
}

struct Day: Equatable {
    var variables = [Variable]()
    var result: Double
}

struct PredictionModel {
    var days = [Day]() {
        didSet {
            prediction = updatePrediction()
        }
    }
    var prediction: Double? = nil
    
    func updatePrediction() -> Double? {
        if days.isEmpty {
            return nil
        }
        let numerator = days.reduce(0.0) { $0 + $1.result }
        return numerator / Double(days.count)
    }
}
