//
//  NetWorkLayerHelper.swift
//  MVVM_SingleAPI
//
//  Created by User on 18/03/22.
//

import Foundation



enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol NetworkServiceProtocol {
    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void)
}

protocol DataRequest {
    associatedtype Response
    
    //this will be used to hit the service
    var url: String { get }
    
    var method: HTTPMethod { get }
    
    var domain: String { get }
    
    var headers: [String : String] { get }
    var queryItems: [String : String] { get }
    
    func decode(_ data: Data) throws -> Response
}


extension DataRequest where Response: Decodable {
    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: data)
        
        
        
    }
}

//Default implementation as some times we dont need this in any service
extension DataRequest {
    var headers: [String : String] {
        [:]
    }
    
    var queryItems: [String : String] {
        [:]
    }
}


