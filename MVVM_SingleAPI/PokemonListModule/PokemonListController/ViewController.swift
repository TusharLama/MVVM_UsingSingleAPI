//
//  ViewController.swift
//  MVVM_SingleAPI
//
//  Created by User on 18/03/22.
//

import UIKit

class ViewController: UIViewController {

    var viewModel: PokemonListViewModel!
 
    var pokemonTableView: CommonTable<PokemonListResult,UITableViewCell>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
               
        setUPViewModel()
        // Do any additional setup after loading the view.
    }
    
    
    func setUPViewModel(){
        
        if Utility.isConnectedToNetwork(){
            self.view.activityStartAnimating()
            self.viewModel = PokemonListViewModel(netWorkObj: DefaultManagerClass())
            self.viewModel.bindPokemonViewModelToController = { [weak self] in
                DispatchQueue.main.async {
                    self?.view.activityStopAnimating()
                    if self?.viewModel.pokemonListModel != nil{
                        self?.configureTable()
                    }else{
                        if let weakSelf = self{
                            Utility.showSimpleAlert(title: self?.viewModel.errorMessage ?? "", message: "Please try again after some time", controller: weakSelf)
                        }
                        
                    }
                }
            }
        }else{
            Utility.showSimpleAlert(title: "Internet Issue", message: "Please Connect To Internet/Wifi", controller: self)
        }
        
    }
    
    
    fileprivate func configureTable(){
        
        if let hasData = self.viewModel.pokemonListModel{
            
            pokemonTableView = CommonTable(frame: view.frame, items: hasData.results, cellIdentifier: PokemonCellIndentifiers.kPokemonNameCell, configCell: { (item,cell) in
                
                guard let cell = cell as?  PokemonNameCell else{
                    return
                }
                cell.nameLabel.text = "\(item.name)"
                
            }, cellSelection: {  (item,cell) in
                
                print(" \(item.name) cell was clicked")
                
            })
            
        }
        
        view.addSubview(pokemonTableView)
        
    }
    
}

