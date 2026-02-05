//
//  Untitled.swift
//  CleanArchitectureDemo
//
//  Created by Tejas on 04/02/26.
//


import CryptoKit
import Foundation


class SecurityHelper    {
    
    
    let key = SymmetricKey(size: .bits256)

    /// Used for:
    ///Password hashing
    //Data integrity checks
    //File verification
    /// - Parameter input: input description
    /// - Returns: description
    func sha256(_ input: String) -> String {
        let data = Data(input.utf8)
        let hash = SHA256.hash(data: data)
        return hash.compactMap { String(format: "%02x", $0) }.joined()
    }
    
    
    
    ///Symmetric Encryption (AES-GCM) 🔒
    ///Used for:
    ///Encrypting local data
    ///Secure API payloads
    ///Tokens, sensitive info
    func encrypt(_ text: String) throws -> Data {
        
       let data = Data(text.utf8)
        let sealedBox = try AES.GCM.seal(data, using: key)
        return sealedBox.combined!
    }
    
    func decrypt(_ encryptedData: Data) throws -> String {
        let box = try AES.GCM.SealedBox(combined: encryptedData)
        let decrypted = try AES.GCM.open(box, using: key)
        return String(decoding: decrypted, as: UTF8.self)
    }

}


