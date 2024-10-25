//
//  KeychainHelper.swift
//  SeekAsiaAssesment
//
//  Created by Syed Uzair - Work on 10/25/24.
//


import Foundation

final class KeychainManager {
    
    static let shared = KeychainManager()
    
    private init() {}
    
    func store(data: Data, for service: String, account: String) {
        
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecValueData: data
        ] as CFDictionary
        
        let status = SecItemAdd(query, nil)
        
        if status != errSecSuccess {
            print("Failed to store item with status code: \(status)")
        }
        
        handleDuplicate(data: data, service: service, account: account, status: status)
    }
    
    private func handleDuplicate(data: Data, service: String, account: String, status: OSStatus) {
        guard status == errSecDuplicateItem else { return }
        
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
        ] as CFDictionary
        
        let updatedData = [kSecValueData: data] as CFDictionary
        
        SecItemUpdate(query, updatedData)
    }
    
    func retrieve(service: String, account: String) -> Data? {
        
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
            kSecReturnData: true
        ] as CFDictionary
        
        var retrievedData: AnyObject?
        let status = SecItemCopyMatching(query, &retrievedData)
        
        if status != errSecSuccess {
            print("Failed to retrieve item with status code: \(status)")
        }
        
        return retrievedData as? Data
    }
    
    func remove(service: String, account: String) {
        
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: account,
        ] as CFDictionary
        
        let status = SecItemDelete(query)
        
        if status != errSecSuccess {
            print("Failed to delete item with status code: \(status)")
        }
    }
}
