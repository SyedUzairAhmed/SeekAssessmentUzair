//
//  HomeViewModel.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/27/24.
//
import Foundation
import UIKit
import Apollo
import BaseAPI

class HomeViewModel {
    
    private var homeApiCall: HomeApiCall
    var jobPosts: [JobPostModel] = []
    var errorMessage: String?
    private(set) var totalItems: Int = 0
    
    init(homeApiCall: HomeApiCall = HomeApiCall()) {
        self.homeApiCall = homeApiCall
    }
    
    func fetchPosts(page: Int, limit: Int = 10, completion: @escaping () -> Void) {
        
        homeApiCall.fetchJobs(limit: limit, page: page, onCompletion: { [weak self] response, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
            }
            else if let jobPosts = response {
                self?.jobPosts.append(contentsOf: jobPosts)
                self?.totalItems = self?.homeApiCall.totalJobsCount ?? 0
            }
            
        })
    }
}
