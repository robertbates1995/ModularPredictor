//
//  ModularPredictorTests.swift
//  ModularPredictorTests
//
//  Created by Robert Bates on 1/31/24.
//

import XCTest
@testable import ModularPredictor

struct TestState: Equatable {
    var variables: [Variable]
    var prediction: Int?
    
    init(_ model: ) {
        self.variables = variables
        self.prediction = prediction
    }
}

final class ModularPredictorTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
}
