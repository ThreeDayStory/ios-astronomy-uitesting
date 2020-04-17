//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Jessie Ann Griffin on 4/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy

class AstronomyUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app.launchArguments = ["UITesting"]
        app.launch()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        //continueAfterFailure = false
    }

    func testSavingPhoto() {

        app.collectionViews.children(matching: .cell).element(boundBy: 3).otherElements.containing(.image, identifier:"imageOnColllectionView").element.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let savePhotoAlert = app.alerts["Photo Saved!"]
        
        XCTAssert(savePhotoAlert.exists)
    }
    
    func testViewingImageDetails() {
        
        let app = XCUIApplication()
        app.collectionViews.children(matching: .cell).element(boundBy: 4).otherElements.containing(.image, identifier:"imageOnColllectionView").element.tap()
        
        let photoDetailShowing = app.images["PhotoDetailViewController.ImageView"].waitForExistence(timeout: 2)
        
        XCTAssert(photoDetailShowing)
    }
    
    func testChoosingAnewSol() {
        
    }
    
    func testScrolling() {
        
        app.collectionViews.containing(.other, identifier:"Vertical scroll bar, 4 pages").element.swipeUp()
        
        XCTAssertTrue(<#T##expression: Bool##Bool#>)
    }
}

extension AstronomyUITests {
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
}