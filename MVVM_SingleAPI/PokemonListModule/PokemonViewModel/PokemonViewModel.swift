//
//  PokemonViewModel.swift
//  MVVM_SingleAPI
//
//  Created by User on 18/03/22.
//

import Foundation

protocol ProkemonListViewModelProtocol{

   //optinal closure because Closure is already escaping in optional type argument
    
    var bindPokemonViewModelToController: (() -> Void)? {get}
    var errorMessage: String? { get }
    func fetchPokemonList()
    
}


class PokemonListViewModel: ProkemonListViewModelProtocol{
    
       var pokemonListModel: PokemonListModel? {
        didSet{
           // Value of optional type '(() -> Void)?' must be unwrapped to a value of type '() -> Void'
            (self.bindPokemonViewModelToController ?? ({}))()
                        
        }
    }
    
    let networkLayer: NetworkServiceProtocol
    var bindPokemonViewModelToController: (() -> Void)?
    
    
    var errorMessage: String?
    
  
    init(netWorkObj : NetworkServiceProtocol  = DefaultManagerClass()){
        self.networkLayer = netWorkObj
        fetchPokemonList()
    }
    
    
    
    func fetchPokemonList() {
        
        networkLayer.request(PokemonRequestLayer(), completion: { [weak self] result in
            
            switch result{
            case .success(let response):
                
                self?.pokemonListModel = response
                
            case .failure(let error):
                
                self?.pokemonListModel = nil
                self?.errorMessage = "This error is due to \(error.localizedDescription)"
            }
            
        })
        
    }
    
    
    
    
}
