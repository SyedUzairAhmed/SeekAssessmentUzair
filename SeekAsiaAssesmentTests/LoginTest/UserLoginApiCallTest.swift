//
//  UserLoginApiCallTest.swift
//  SeekAsiaAssesmentTests
//
//  Created by Syed Uzair - Work on 10/28/24.
//

import XCTest
@testable import SeekAsiaAssesment

final class UserLoginApiCallTest: XCTestCase {

    var sut: UserLoginApiCall!
    var timeoutApi: TimeInterval = 20

    override func setUp() {
        self.sut = UserLoginApiCall()
    }
    override func tearDown() {
        self.sut = nil
    }
    
    func test_login_success_response() {
      
        let expectation = self.expectation(description: "Login_Success_Returns_LoginModel")
        
        sut.login(username: "user1", password: "Seeker1123") { response , error  in
            
            XCTAssertNotNil(response)
            XCTAssertNil(error)
            expectation.fulfill()
            
        }
        
        waitForExpectations(timeout: timeoutApi, handler: nil)
    }
    
    func test_login_invalid_creditials() {
        
        let expectation = self.expectation(description: "Login_Failur_Invalid_Credentials")
        sut.login(username: "customer1", password: "Seeker000122") { response , error  in
            XCTAssertNil(response)
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: timeoutApi, handler: nil)
    }
    
    func test_login_missing_credentials() {
        let expectation = self.expectation(description: "Login_Failur_Missing_Credentials")
        sut.login(username: "", password: "") { response , error  in
            XCTAssertNil(response)
            XCTAssertNotNil(error)
            XCTAssertEqual(error?.localizedDescription, "401: Unauthorized")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: timeoutApi, handler: nil)
    }
    
    func test_login_network_error() {
        let expectation = self.expectation(description: "Login_Failur_Network_Error")
        sut.login(username: "user1", password: "Seeker1123") { response , error  in
            
            // This one will change according to the server responses in this case
            XCTAssertNil(response)
            XCTAssertNotNil(error)
            XCTAssertEqual(error?.localizedDescription, "Network Error")
            expectation.fulfill()
        }
        waitForExpectations(timeout: timeoutApi,handler: nil)
    }
  
         
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
