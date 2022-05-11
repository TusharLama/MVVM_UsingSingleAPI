//
//  MVVM_SingleAPITests.swift
//  MVVM_SingleAPITests
//
//  Created by User on 23/03/22.
//

import XCTest
@testable import MVVM_SingleAPI

class PokemonListViewModelTest: XCTestCase {
    
    var sut: PokemonListViewModel!
    var mockAPIService:  MockAPIService!
    

    override func setUp() {
        mockAPIService  = MockAPIService()
        sut = PokemonListViewModel(netWorkObj: MockAPIService())
    }
    
    
    override func tearDown() {
        sut = nil
        mockAPIService = nil
    }

    
    func testViewModelWithData(){
        
        //Given
       
        sut.fetchPokemonList()
        
       
        XCTAssertNotNil(sut.pokemonListModel)
        
        XCTAssertEqual(sut.pokemonListModel?.results.count, 100)
        
        
        
        
        
        
    }
    
}

extension PokemonListViewModelTest{
    
    func generatePokemonMockData() -> PokemonListModel?{
            let path = Bundle.main.path(forResource: "MockData", ofType: "json")!
            let data = try! Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            let mockData = try! decoder.decode(PokemonListModel?.self, from: data)
             return mockData
                
    }
    
  
    
}
