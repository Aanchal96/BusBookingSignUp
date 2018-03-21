//
//  AddPassenger.swift
//  TableViewScreen
//
//  Created by Appinventiv on 26/02/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class AddPassenger: UITableViewCell, UITextFieldDelegate{

    var passenger : [String] = ["Aanchal", "Saloni", "Nikhil", "Prakhar", "Arpit", "Rishabh"]
    var age : [String] = ["21", "20", "15", "25", "23","16"]
    
  //  var indexPath : IndexPath?
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var ageTF: UITextField!
    @IBAction func addPassengerButton(_ sender: Any) {
        passenger.append(nameTF.text!)
        age.append(ageTF.text!)
        
//        let indexPath = IndexPath(row: passenger.count - 1, section 0 )
//        tableView.beginUpdate()
//        passDetails.tableView.insertRows(at:[indexPath], with: .automatic)
//        tableView.endUpdate()
        
    }
//    func dataPrint(indexPath: IndexPath) {
//        self.indexPath = indexPath
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        nameTF.delegate = self
        ageTF.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
