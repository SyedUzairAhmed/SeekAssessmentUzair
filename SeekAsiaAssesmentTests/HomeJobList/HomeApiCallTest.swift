//
//  HomeApiCallTest.swift
//  SeekAsiaAssesmentTests
//
//  Created by Syed Uzair - Work on 10/28/24.
//

import XCTest
@testable import SeekAsiaAssesment

final class HomeApiCallTest: XCTestCase {
    
    var sut: HomeApiCall!
    var timeoutApi: TimeInterval = 20

    override func setUp() {
        self.sut = HomeApiCall()
    }
    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }
    
    
    func test_joblist_success_response() {
        let expectation = self.expectation(description: "Job_Fetch_Success_Returns_JobPostModel")
        let limit = 10
        let page = 1
        
        sut.fetchJobs(limit: limit, page: page){ response , error  in
            XCTAssertNil(error)
            XCTAssertNotNil(response)
            XCTAssertFalse(response?.isEmpty ?? true)
            expectation.fulfill()
        }
        waitForExpectations(timeout: timeoutApi, handler: nil)
    }
    
    func test_joblist_with_invalid_params() {
        let expectation = self.expectation(description: "Job_Fetch_Failure_Invalid_Params")
        let limit = -1
        let page = 999
        
        sut.fetchJobs(limit: limit, page: page){ response , error  in
            XCTAssertNil(response)
            XCTAssertNotNil(error)
            XCTAssertEqual(error as? JobsServiceError, JobsServiceError.unknownError)
            expectation.fulfill()
        }
        waitForExpectations(timeout: timeoutApi, handler: nil)
    }
    
    
    func test_joblist_network_error() {
        let expectation = self.expectation(description: "Login_Failur_Network_Error")
        let limit = 10
        let page = 1
        
        sut.fetchJobs(limit: limit, page: page){ response , error  in
            
            // This one will change according to the server responses in this case
            XCTAssertNil(response)
            XCTAssertNotNil(error)
            XCTAssertEqual(error?.localizedDescription, "Network Error")
            expectation.fulfill()
        }
        waitForExpectations(timeout: timeoutApi,handler: nil)
    }

}
