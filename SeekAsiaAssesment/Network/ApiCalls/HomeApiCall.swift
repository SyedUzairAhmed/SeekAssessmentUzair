//
//  HomeApiCall.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/27/24.
//

import Foundation
import BaseAPI

protocol HomeApiCallService {
    func fetchJobs(limit: Int, page: Int, onCompletion: @escaping NetworkServiceCompletion<[JobPostModel]>)
}

enum JobsServiceError: Error, LocalizedError {
    case dataNotFound
    case unknownError

    var errorDescription: String? {
        switch self {
        case .dataNotFound:
            return "The requested data could not be found."
        case .unknownError:
            return "An unknown error occurred."
        }
    }
}


class HomeApiCall: HomeApiCallService {
    private var jobList: [JobPostModel] = []
    var totalJobsCount: Int = 0

    func fetchJobs(limit: Int, page: Int, onCompletion: @escaping NetworkServiceCompletion<[JobPostModel]>) {
        let limitParam = GraphQLNullable<Int>(integerLiteral: limit)
        let pageParam = GraphQLNullable<Int>(integerLiteral: page)

        Network.shared.apollo.fetch(query: GetJobsQuery(limit: limitParam, page: pageParam)) { result in
            switch result {
            case .success(let graphQLResult):
                guard let data = graphQLResult.data, let jobsResponse = data.jobs else {
                    onCompletion(nil,JobsServiceError.unknownError)
                    return
                }
                
                self.totalJobsCount = jobsResponse.total ?? 0
                onCompletion(self.mapToSeekJobs(from: jobsResponse), nil)
                
            case .failure(let error):
                onCompletion(nil, JobsServiceError.unknownError)
            }
        }
    }

    private func mapToSeekJobs(from jobsData: GetJobsQuery.Data.Jobs) -> [JobPostModel] {
        var mappedJobs: [JobPostModel] = []

        jobsData.jobs?.forEach { job in
            let salaryDetails = SalaryRange(
                max: job?.salaryRange?.max ?? 0,
                min: job?.salaryRange?.min ?? 0
            )
            
            let aJob = JobPostModel(
                id: job?._id ?? "",
                description: job?.description ?? "",
                haveIApplied: job?.haveIApplied ?? false,
                industry: job?.industry ?? 0,
                location: job?.location ?? 0,
                positionTitle: job?.positionTitle ?? "",
                salaryRange: salaryDetails
            )
            
            mappedJobs.append(aJob)
        }
        return mappedJobs
    }
}

