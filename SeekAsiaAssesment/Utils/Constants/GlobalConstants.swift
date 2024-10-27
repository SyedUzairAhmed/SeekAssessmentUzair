//
//  GlobalConstants.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/26/24.
//


struct GlobalValidation{
    
    static let emailValidationMessage: String = "Please enter a valid email address."
    static let emailIsEmptyMessage: String = "Please enter your email address."
    static let passwordIsEmptyMessage: String = "Please enter your password."
    static let comingSoonMessage: String = "Coming soon..."
    
}

struct NetworkingConstants {
    
    static let baseURL: String = "http://localhost:3002/"
    static let errorMessage: String = "Something went wrong. Please try again later."
    static let logoutMessage: String = "You have been logged out successfully."
}

struct KeychainConstants {
    
    static let keychainService: String = "User_Auth"
    static let keychainAccount: String = "User_Account"
}

struct JobUtilities {
    
    static func formatSalaryRange(min: Int?, max: Int?) -> String {
        switch (min, max) {
        case (let min?, let max?):
            return "$\(min.formattedWithCommas) - $\(max.formattedWithCommas)"
        case (let min?, nil):
            return "From $\(min.formattedWithCommas)"
        case (nil, let max?):
            return "Up to $\(max.formattedWithCommas)"
        default:
            return "Salary not specified"
        }
    }
    
    static func getLocationString(for locationCode: Int) -> String {
        let locations = [
            0: "Remote",
            1: "On-site",
            2: "Hybrid"
        ]
        return locations[locationCode] ?? "No Location"
    }

    static func getIndustryString(for industryCode: Int) -> String {
        let industries = [
            0: "Technology",
            1: "Finance",
            2: "Healthcare"
        ]
        return industries[industryCode] ?? "No Industry"
    }
}
