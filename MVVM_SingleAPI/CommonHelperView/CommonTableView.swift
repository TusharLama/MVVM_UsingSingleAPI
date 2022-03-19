//
//  CommonTableView.swift
//  MVVM_SingleAPI
//
//  Created by User on 18/03/22.
//

import UIKit


class CommonTable <Item,Cell: UITableViewCell> : UITableView,UITableViewDelegate,UITableViewDataSource{
    
    //this will hold all the custom array item
    var items: [Item]!
    
    
    //we will configure cell with this
    var configCell: (Item,Cell) -> ()
    
    //configuring cell like this
    
    var cellSelection: (Item,Cell) -> ()
    
    
    var cellIdentifier : String?
    
    
    //you can also add custom things as per your requirement
    
    
    //initializing table view
    
    init(frame: CGRect,items: [Item],cellIdentifier: String,configCell: @escaping (Item,Cell) -> (), cellSelection: @escaping (Item,Cell) -> () ){
        self.items  = items
        self.configCell = configCell
        self.cellSelection = cellSelection
        super.init(frame: frame, style: .plain)
        self.separatorColor = .black
        self.delegate = self
        self.dataSource = self
        self.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.cellIdentifier = cellIdentifier
        self.estimatedRowHeight = 44
        self.rowHeight = UITableView.automaticDimension
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.dequeueReusableCell(withIdentifier: cellIdentifier ?? "", for: indexPath) as? Cell else {
            return UITableViewCell()
        }
        
        configCell(items[indexPath.row],cell)

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cellAvailableAtIndex = self.cellForRow(at: indexPath) as? Cell{
            
            cellSelection(items[indexPath.row],cellAvailableAtIndex)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}


    
    


