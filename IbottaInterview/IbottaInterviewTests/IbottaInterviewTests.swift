//
//  IbottaInterviewTests.swift
//  IbottaInterviewTests
//
//  Created by Zach Vilardell on 11/9/17.
//  Copyright © 2017 zvilardell. All rights reserved.
//

import XCTest
@testable import IbottaInterview

class IbottaInterviewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testUIColorFromHex() {
        //test red UIColor from hex string, with and without '#' prefix
        XCTAssertEqual(UIColor.fromHex(string: "#FF0000"), UIColor.red, "Red UIColor objects do not match")
        XCTAssertEqual(UIColor.fromHex(string: "FF0000"), UIColor.red, "Red UIColor objects do not match")
        //test red UIColor from hex string with alpha value
        XCTAssertEqual(UIColor.fromHex(string: "#FF000000"), UIColor.red.withAlphaComponent(0.0), "Red UIColor objects do not match")
        //test green UIColor from hex string
        XCTAssertEqual(UIColor.fromHex(string: "#00FF00"), UIColor.green, "Green UIColor objects do not match")
        //test blue UIColor from hex string
        XCTAssertEqual(UIColor.fromHex(string: "#0000FF"), UIColor.blue, "Blue UIColor objects do not match")
        //test incorrect hex code formatting (fromHex returns nil)
        XCTAssertEqual(UIColor.fromHex(string: "#FDA8"), nil)
    }
    
}
