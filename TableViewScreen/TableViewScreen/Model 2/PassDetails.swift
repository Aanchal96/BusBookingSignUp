//
//  PassDetails.swift
//  TableViewScreen
//
//  Created by Appinventiv on 26/02/18.
//  Copyright © 2018 Appinventiv. All rights reserved.

import UIKit

protocol SendDataProtocol {
    func dataPrint(indexPath: IndexPath)
}


class PassDetails: UITableViewCell, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var innerTableView: UITableView!
        let obj = AddPassenger()
    
    var delegate : SendDataProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        innerTableView.dataSource = self
        innerTableView.delegate = self
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//MARK: --> Inner table view extension

extension PassDetails{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return obj.passenger.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = innerTableView.dequeueReusableCell(withIdentifier: "AddedPassenger") as! AddedPassenger
        
        self.delegate?.dataPrint(indexPath: indexPath)
        
        let names = obj.passenger[indexPath.row]
        cell.nameLabel.text = names
        let age = obj.age[indexPath.row]
        cell.ageLabel.text = age
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath : IndexPath){
        if editingStyle == .delete {
            obj.passenger.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}
