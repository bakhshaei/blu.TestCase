//
//  TransferDestinationService.swift
//  blue-TestCase
//
//  Created by Amin on 4/20/23.
//

import Foundation


//MARK: - Service
protocol TransferDestinationServiceProtocol {
    func loadData(fromPage page: Int) async throws -> [TransferDestination]?
}

enum TransferDestinationServiceError: Error {
    case invalidURL
    case errorResponseStatusCode(_ : Int?)
}

class TransferDestinationService: TransferDestinationServiceProtocol {
    
    private let baseURL = URL(string: "https://4e6774cc-4d63-41b2-8003-336545c0a86d.mock.pstmn.io/transfer-list/")
    private let session: URLSession = .shared
    
    
    /// Fetch data from the API for `n`th page.
    /// - Parameter page: If an spacific page number passed the API will call for that page number.
    /// - Returns: List of fetched objects.
    func loadData(fromPage page: Int) async throws -> [TransferDestination]? {
        guard let url = URL(string: String(page), relativeTo: baseURL) else {
            throw TransferDestinationServiceError.invalidURL
        }
        
        do {
            let (data, response) = try await session.data(from: url)
            
            guard let httpsResponse = response as? HTTPURLResponse,
                  httpsResponse.statusCode == 200 else {
                throw TransferDestinationServiceError.errorResponseStatusCode((response as? HTTPURLResponse)?.statusCode )
            }
            if let object = try? JSONDecoder().decode([TransferDestination].self, from: data) {
                return object
            }
            return nil
        }
        catch {
            throw error
        }
    }
}
