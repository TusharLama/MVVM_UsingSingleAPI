//
//  PokemonListModel.swift
//  MVVM_SingleAPI
//
//  Created by User on 18/03/22.
//


import Foundation

// MARK: - PokemonListModel
struct PokemonListModel: Codable {
    let count: Int
    let next, previous: String
    let results: [PokemonListResult]
}

// MARK: - PokemonListResult
struct PokemonListResult: Codable {
    let name: String
    let url: String
}
