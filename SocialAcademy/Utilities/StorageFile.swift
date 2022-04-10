//
//  StorageFile.swift
//  SocialAcademy
//
//  Created by Janne Immonen on 23.3.2022.
//

import Foundation
import FirebaseStorage
import FirebaseStorageSwift

struct StorageFile {
    private let storageReference: StorageReference
    
    func putFile(from fileURL: URL) async throws -> Self {
        _ = try await storageReference.putFileAsync(from: fileURL)
        return self // for method chaining
    }
    
    func getDownloadURL() async throws -> URL {
        return try await storageReference.downloadURL()
    }
    
    func delete() async throws {
        try await storageReference.delete()
    }
}

extension StorageFile {
    private static let storage = Storage.storage()
    
    static func with(namespace: String, identifier: String) -> StorageFile {
        let path = "\(namespace)/\(identifier)"
        let storageReference = storage.reference().child(path)
        return StorageFile(storageReference: storageReference)
    }
    
    static func atURL(_ downloadURL: URL) -> StorageFile {
        let storageReference = storage.reference(forURL: downloadURL.absoluteString)
        return StorageFile(storageReference: storageReference)
    }
}
