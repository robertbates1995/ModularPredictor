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
    var prediction: Bool
    
    init(_ model: PredictionModel) {
        self.variables = model.variables
        self.prediction = model.prediction
    }
}

final class ModularPredictorTests: XCTestCase {
    var sut = PredictionModel()
    lazy var given = StateTester(given: {TestState(self.sut)})
    
    func testEmptyPrediction() throws {
        XCTAssertNil(sut.prediction)
        XCTAssertEqual(sut.variables, [])
    }
    
    func testAddBoolInput() throws {
        let newVar = Variable(title: "test title", value: .trueFalse(true))
        given.when({sut.variables.append(newVar)}) {
            $0.change(\.variables, [newVar])
        }
    }
    
    func testAddDoubleInput() throws {
        let newVar = Variable(title: "test title", value: .number(1.0))
        given.when({sut.variables.append(newVar)}) {
            $0.change(\.variables, [newVar])
        }
    }
    
    func testAddPickerInput() throws {
        let newVar = Variable(title: "test title", value: .picker(["test1", "test2"]))
        given.when({sut.variables.append(newVar)}) {
            $0.change(\.variables, [newVar])
        }
    }
    
    func testTrueFalseUpdated() throws {
        sut.variables.append(Variable(title: "test title", value: .trueFalse(true)))
        given.when({sut.updatePrediction()}) {
            $0.change(\.prediction, .trueFalse(true))
        }
        
        sut.variables = [Variable(title: "test title", value: .trueFalse(false))]
        given.when({sut.updatePrediction()}) {
            $0.change(\.prediction, .trueFalse(false))
        }
    }
    
    func testNumberUpdated() throws {
        sut.variables.append(Variable(title: "test title", value: .number(1.0)))
        given.when({sut.updatePrediction()}) {
            $0.change(\.prediction, .number(1.0))
        }
    }
}
