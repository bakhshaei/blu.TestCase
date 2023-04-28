//
//  FileController.swift
//  blue-TestCase
//
//  Created by Amin on 4/28/23.
//

import Foundation

class FileController {
    private func pathCreator(
        withName documentName: String,
        locatedIn directory: FileManager.SearchPathDirectory = .cachesDirectory
    ) throws -> URL {
        let folderURL = try  FileManager.default.url(
            for: directory,
            in: FileManager.SearchPathDomainMask.userDomainMask,
            appropriateFor: nil,
            create: false)
        return folderURL.appendingPathComponent(documentName)
    }
    
    /// Write a _value_ with specified _documentName_ on the application sandbox in the mentioned _directory_.
    /// - Parameters:
    ///   - value: The _value_ or _object_ that is going to write in the location.
    ///   - documentName: Name for the _value_ to address it later.
    ///   - encoder: Use to encode to converting _value_ to data. **Default value is JSONEncoder()**
    ///   - directory: Specify the directory that _value_ should write place in. **Default value is .cachesDirectory**
    func write <T: Encodable> (
        _ value: T,
        withName documentName: String,
        encodedUsing encoder: JSONEncoder = .init(),
        locatedIn directory: FileManager.SearchPathDirectory = .cachesDirectory
    ) throws {
        let docURL = try pathCreator(withName: documentName, locatedIn: directory)
        let data = try encoder.encode(value)
        try data.write(to: docURL)
    }
    
    func load <U: Decodable> (
        withName documentName: String,
        decodeWith decoder: JSONDecoder = .init(),
        fromDirectory directory: FileManager.SearchPathDirectory = .cachesDirectory
    ) throws -> U {
        let docURL = try pathCreator(withName: documentName, locatedIn: directory)
        let data = try Data(contentsOf: docURL)
        return try decoder.decode(U.self, from: data)
    }
    
    func loadFromBundle <U: Decodable> (
        withName documentName: String,
        extension ext: String? = nil,
        decodeWith decoder: JSONDecoder = .init()
    ) throws -> U? {
        guard let file = Bundle.main.url(forResource: documentName, withExtension: ext) else {
            //fatalError("Couldn't find \(documentName) in main bundle.")
            return nil
        }
        let data = try Data(contentsOf: file)
        return try decoder.decode(U.self, from: data)
    }
    
    
    func deleteFile(
        withName documentName: String,
        locatedIn directory: FileManager.SearchPathDirectory = .cachesDirectory
    ) throws {
        let docURL = try pathCreator(withName: documentName, locatedIn: directory)
        try FileManager.default.removeItem(at: docURL)
    }
}
