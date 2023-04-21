//
//  TransferDestinationService.swift
//  blue-TestCase
//
//  Created by Amin on 4/20/23.
//

import Foundation


//MARK: - Service
protocol TransferDestinationServiceProtocol {
    func loadData(fromPage page: Int?) async throws -> [TransferDestination]?
}

enum TransferDestinationServiceError: Error {
    case invalidURL
    case errorResponseStatusCode(_ : Int?)
}

class TransferDestinationService: TransferDestinationServiceProtocol {
    
    private let baseURL = URL(string: "https://4e6774cc-4d63-41b2-8003-336545c0a86d.mock.pstmn.io/transfer-list/")
    private let session: URLSession = .shared
    
    /// A variable to store current page that is already fetched.
    private var pageCounter = 1
    
    /// Fetch data from the API for `n`th page.
    /// - Parameter page: If an spacific page number passed the API will call for that page number. Otherwise an internal counter fetched pages and automatically increase by each successful fetch.
    /// - Returns: List of fetched objects.
    func loadData(fromPage page: Int? = nil) async throws -> [TransferDestination]? {
        let pageNo = page ?? pageCounter
        guard let url = URL(string: String(pageNo), relativeTo: baseURL) else {
            throw TransferDestinationServiceError.invalidURL
        }
        
        do {
            let (data, response) = try await session.data(from: url)
            
            guard let httpsResponse = response as? HTTPURLResponse,
                  httpsResponse.statusCode == 200 else {
                throw TransferDestinationServiceError.errorResponseStatusCode((response as? HTTPURLResponse)?.statusCode )
            }
            if let object = try? JSONDecoder().decode([TransferDestination].self, from: data) {
                pageCounter += 1
                return object
            }
            return nil
        }
        catch {
            throw error
        }
    }
}
