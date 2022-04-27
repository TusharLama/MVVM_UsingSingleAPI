//
//  MockPokemonViewModel.swift
//  MVVM_SingleAPITests
//
//  Created by User on 03/04/22.
//

import Foundation
@testable import MVVM_SingleAPI

class MockAPIService:NetworkServiceProtocol {
   
    private (set) var pokemonListModel: PokemonListModel?
    
    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void){
        
     
        let path = Bundle.main.path(forResource: "MockData", ofType: "json")!
        let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))
        let listObj = try! JSONDecoder().decode(PokemonListModel.self, from: jsonData)
        
        completion(.success(listObj as! Request.Response))
        
        
    }
    

    
   
    
    
}
