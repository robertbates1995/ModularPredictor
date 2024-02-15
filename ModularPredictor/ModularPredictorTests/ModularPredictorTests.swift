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
    
    var days: [Day]
    var prediction: Double?
    
    init(_ model: PredictionModel) {
        self.days = model.days
        self.prediction = model.prediction
    }
}

final class ModularPredictorTests: XCTestCase {
    var sut = PredictionModel()
    lazy var given = StateTester(given: {TestState(self.sut)})
    var day = Day(variables: [Variable(title: "test", value: 1.0)], result: 1.0)
    
    func testEmptyPrediction() {
        XCTAssertNil(sut.prediction)
        XCTAssertEqual(sut.days, [])
    }
    
    func testOneDay() {
        given.when({sut.days.append(day)}) {
            $0.change(\.prediction, 1.0)
            $0.change(\.days, [day])
        }
    }
    
    func testTwoDays() {
        let dayTwo = Day(variables: [Variable(title: "two", value: 0.0)], result: 0.0)
        sut.days.append(day)
        given.when({sut.days.append(dayTwo)}) {
            $0.change(\.prediction, 0.5)
            $0.change(\.days, [day, dayTwo])
        }
    }
    
    func testMultipleVariables() {
        day.variables.append(Variable(title: "two", value: 0.0))
        given.when({sut.days.append(day)}) {
            $0.change(\.prediction, 0.5)
            $0.change(\.days, [day])
        }
    }
}
