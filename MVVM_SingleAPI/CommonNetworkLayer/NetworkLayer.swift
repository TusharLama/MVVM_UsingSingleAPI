//
//  NetworkLayer.swift
//  MVVM_SingleAPI
//
//  Created by User on 18/03/22.
//

import Foundation




class DefaultManagerClass: NetworkServiceProtocol{
    
    
    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void){
        
        
        guard let urlComponent = URLComponents(string: request.url) else{
            return
        }
        
        guard let url = urlComponent.url else {
            return
        }
        
       
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                return completion(.failure(error!))
            }
            
            guard let data = data else {
                return completion(.failure(error!))
            }
            
            do {
                try completion(.success(request.decode(data)))
            } catch let error as NSError {
                completion(.failure(error))
            }
        }
        .resume()
        
        
    }
    
    
}
