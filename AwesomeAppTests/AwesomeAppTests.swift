import UIKit
import XCTest
import AwesomeApp

class AwesomeAppTests: XCTestCase {
    
    var firstInt = 0
    var secondInt = 0
    var expectedSum = 0
        
    override func setUp() {
        super.setUp()
        
        self.firstInt = 1
        self.secondInt = 2
        self.expectedSum = 3
    }
    
    override func tearDown() {
        self.firstInt = 0
        self.secondInt = 0
        self.expectedSum = 0
        super.tearDown()
    }
   	
    func testSumOfInts() {
        
        XCTAssertEqual(sumOfInts(self.firstInt, self.secondInt), sumOfInts(self.secondInt, self.firstInt))

        let sum = sumOfInts(self.firstInt, self.secondInt)
        XCTAssert(sum == self.expectedSum)
        if self.firstInt < 0 && self.secondInt < 0 {
            XCTAssertLessThan(sum, 0)
        }
        else {
            if self.firstInt < 0 {
                XCTAssertLessThan(sum, self.secondInt)
            }
            if self.secondInt < 0 {
                XCTAssertLessThan(sum, self.firstInt)
            }
            if self.firstInt >= 0 && self.secondInt >= 0 {
                XCTAssertGreaterThanOrEqual(sum, 0)
                XCTAssertGreaterThanOrEqual(sum, self.firstInt)
                XCTAssertGreaterThanOrEqual(sum, self.secondInt)
            }
        }
    }
    
    func testDownloadImageCallback() {
        
        let downloadImageCallbackExpectation = self.expectationWithDescription("downloadImageCallbackExpectation")
        
        let imageUrl = NSURL(string: "http://goo.gl/XYwppm")!
        
        downloadImage(imageUrl) { image in
            downloadImageCallbackExpectation!.fulfill();
        }
        
        self.waitForExpectationsWithTimeout(5.0, handler: nil)
    }
}
