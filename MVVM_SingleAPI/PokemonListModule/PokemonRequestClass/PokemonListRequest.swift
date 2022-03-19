//
//  PokemonListRequest.swift
//  MVVM_SingleAPI
//
//  Created by User on 18/03/22.
//

import Foundation


struct PokemonRequestLayer: DataRequest{
   
    var url: String {
        
        return PokemonConstant.baseURL + "pokemon?offset=100&limit=100"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var domain: String {
        
        return "Fetching Pokemon List"
    }
    
    
    func decode(_ data: Data) throws -> PokemonListModel? {
        let decoder = JSONDecoder()
        let response = try decoder.decode(PokemonListModel.self, from: data)
        return response
    }
    
    
}
