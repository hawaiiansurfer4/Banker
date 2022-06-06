//
//  CurrencyFormatterTests.swift
//  BankerUnitTests
//
//  Created by Sean Murphy on 6/5/22.
//

import Foundation

import XCTest

@testable import Banker

class CurrencyFormatterTests: XCTestCase {
    var formatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testBreakDollarsIntoCents() throws {
        let result = formatter.breakIntoDollarsAndCents(929466.26)
        XCTAssertEqual(result.0, "929,466")
        XCTAssertEqual(result.1, "26")
    }
    
    func testDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(929466.26)
        XCTAssertEqual(result, "$929,466.26")
    }
    
    func testZeroDollarsFormatted() throws {
        let result = formatter.dollarsFormatted(0.0)
        XCTAssertEqual(result, "$0.00")
    }
}
