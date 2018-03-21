//
//  PassengerVC.swift
//  TableViewScreen
//
//  Created by Appinventiv on 26/02/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class PassengerVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setTableDataSource()
        setTableDelegate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

//MARK: --> table view data source methods

extension PassengerVC : UITableViewDataSource{
    func setTableDataSource(){
        self.tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddPassenger") as! AddPassenger
            return cell
        }
        else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier:"PassDetails") as! PassDetails
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BusType") as! BusType
            return cell
        }
    }
}

//MARK: --> table view delegate methods

extension PassengerVC : UITableViewDelegate{
    func setTableDelegate()
    {
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
        if indexPath.row == 0{
            return 150
        }
        else if indexPath.row == 1{
            return 180
        }
        else{
           return 100
        }
    }
   
}


