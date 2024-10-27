//
//  JobPostModel.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/27/24.
//
import Foundation


// MARK: - JobPostModel

struct JobPostModel: Codable {
    let id, description: String?
    let haveIApplied: Bool?
    let industry, location: Int?
    let positionTitle: String?
    let salaryRange: SalaryRange?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case description, haveIApplied, industry, location, positionTitle, salaryRange
    }
    
}

// MARK: - SalaryRange

struct SalaryRange: Codable {
    let max, min: Int?
}
