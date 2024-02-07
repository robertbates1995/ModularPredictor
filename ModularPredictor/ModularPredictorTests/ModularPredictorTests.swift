//
//  ModularPredictorTests.swift
//  ModularPredictorTests
//
//  Created by Robert Bates on 1/31/24.
//

import StateTesting
import XCTest
@testable import ModularPredictor

struct TestState: Equatable {
    
    var variables: [Variable]
    var prediction: Prediction?
    
    init(_ model: PredictionModel) {
        self.variables = model.variables
        self.prediction = model.prediction
    }
}

final class ModularPredictorTests: XCTestCase {
    let sut = PredictionModel()
    lazy var given = StateTester(given: {TestState(self.sut)})
    
    func testEmptyPrediction() throws {
        XCTAssertNil(sut.prediction)
        XCTAssertEqual(sut.variables, [])
    }
        
}
