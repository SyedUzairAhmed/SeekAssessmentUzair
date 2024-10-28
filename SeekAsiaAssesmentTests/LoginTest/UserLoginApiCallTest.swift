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
        super.tearDown()
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
  
}
