//
//  NetworkClient.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/27/24.
//


import Foundation
import Apollo


typealias NetworkServiceCompletion<T: Codable> = ((T?, Error?) -> Void)

class Network {
    static let shared = Network()
    
    private init() {}
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: NetworkingConstants.baseURL)!)
}
