//
//  TestRemainder.swift
//  BigDecimalTests
//
//  Created by Leif Ibsen on 29/09/2022.
//

//
// Test cases from General Decimal Arithmetic - speleotrove.com
//
// ddRemainder

import XCTest
@testable import BigDecimal

final class TestRemainder: XCTestCase {

    override func setUpWithError() throws {
        //BigDecimal.nanFlag = false
    }

    override func tearDownWithError() throws {
        //XCTAssertFalse(BigDecimal.nanFlag)
    }

    struct test {

        let x: String
        let y: String
        let result: String

        init(_ x: String, _ y: String, _ result: String) {
            self.x = x
            self.y = y
            self.result = result
        }
    }
    
    let tests1: [test] = [
        test("1", "1", "0"),
        test("0.", "1", "0"),
        test(".0", "1", "0.0"),
        test("0.00", "1", "0.00"),
        test("0.00E+9", "1", "0"),
        test("0.00E+3", "1", "0"),
        test("0.00E+2", "1", "0"),
        test("0.00E+1", "1", "0.0"),
        test("0.00E+0", "1", "0.00"),
        test("0.00E-0", "1", "0.00"),
        test("0.00E-1", "1", "0.000"),
        test("0.00E-2", "1", "0.0000"),
        test("0.00E-3", "1", "0.00000"),
        test("0.00E-4", "1", "0.000000"),
        test("0.00E-5", "1", "0E-7"),
        test("0.00E-6", "1", "0E-8"),
        test("0.0000E-50", "1", "0E-54"),
        test("1234567890123456", "1.000000000000001", "0.765432109876546"),
        test("1234567890123456", "1.00000000000001", "0.65432109876557"),
        test("1234567890123456", "1.0000000000001", "0.5432109876668"),
        test("1234567890123455", "4.000000000000001", "2.691358027469137"),
        test("1234567890123456", "4.000000000000001", "3.691358027469137"),
        test("1234567890123456", "4.9999999999999", "0.6913578024696"),
        test("1234567890123456", "4.99999999999999", "3.46913578024691"),
        test("1234567890123456", "4.999999999999999", "1.246913578024691"),
        test("1234567890123456", "5.000000000000001", "0.753086421975309"),
        test("1234567890123456", "5.00000000000001", "3.53086421975310"),
        test("1234567890123456", "5.0000000000001", "1.3086421975314"),
        test("0.5", "0.5000001", "0.5000000"),
        test("0.5", "0.50000001", "0.50000000"),
        test("0.5", "0.500000001", "0.500000000"),
        test("0.5", "0.5000000001", "0.5000000000"),
        test("0.5", "0.50000000001", "0.50000000000"),
        test("0.5", "0.4999999", "1E-7"),
        test("0.5", "0.49999999", "1E-8"),
        test("0.5", "0.499999999", "1E-9"),
        test("0.5", "0.4999999999", "1E-10"),
        test("0.5", "0.49999999999", "1E-11"),
        test("0.5", "0.499999999999", "1E-12"),
        test("0.03", "7", "0.03"),
        test("5", "2", "1"),
        test("4.1", "2", "0.1"),
        test("4.01", "2", "0.01"),
        test("4.001", "2", "0.001"),
        test("4.0001", "2", "0.0001"),
        test("4.00001", "2", "0.00001"),
        test("4.000001", "2", "0.000001"),
        test("4.0000001", "2", "1E-7"),
        test("123e1", "1000E299", "1.23E+3"),
    ]

    func test1() throws {
        for t in tests1 {
            XCTAssertEqual((BigDecimal(t.x) % BigDecimal(t.y)).asString(), t.result)
        }
    }

}
