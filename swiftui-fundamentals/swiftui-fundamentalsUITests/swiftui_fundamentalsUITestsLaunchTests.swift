//
// swiftui_fundamentalsUITestsLaunchTests.swift
// swiftui-fundamentalsUITests
//
// Created by Huy D. on 12/18/22
// mjn2max.github.io 😜
// 
// Copyright © 2022. All rights reserved.
// mjn2max.com
//

import XCTest

final class swiftui_fundamentalsUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
