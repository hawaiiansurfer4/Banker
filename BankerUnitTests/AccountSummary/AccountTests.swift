//
//  AccountTests.swift
//  BankerUnitTests
//
//  Created by Sean Murphy on 6/6/22.
//

import Foundation
import XCTest

@testable import Banker

class AccountTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    func testCanParse() throws {
        let json = """
         [
           {
             "id": "1",
             "type": "Banking",
             "name": "Basic Savings",
             "amount": 929466.23,
             "createdDateTime" : "2010-06-21T15:29:32Z"
           },
           {
             "id": "2",
             "type": "Banking",
             "name": "No-Fee All-In Chequing",
             "amount": 17562.44,
             "createdDateTime" : "2011-06-21T15:29:32Z"
           },
          ]
        """

        // Game on here 🕹
        let data = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let result = try decoder.decode([Account].self, from: data)
        
        XCTAssertEqual(result.count, 2)
        
        XCTAssertEqual(result.first?.id , "1")
        XCTAssertEqual(result.first?.type, AccountType.Banking)
        XCTAssertEqual(result.first?.name, "Basic Savings")
        XCTAssertEqual(result.first?.amount, 929466.23)
        XCTAssertEqual(result.first?.createdDateTime.monthDayYearString, "Jun 21, 2010")
    }
}
