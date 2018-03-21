//
//  ViewController.swift
//  TableViewScreen
//
//  Created by Appinventiv on 22/02/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit


class ViewController: Base, UITableViewDataSource, UITableViewDelegate {

    private var expand = true
    //private var expand2 = false
    
    var dict : [String : String] = [:]
    var place = ["First name","Last name","Person to contact in emergency", "10 digit mobile no."]
  
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var dobView: UIView!
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var basicView: UIView!
    
    @IBAction func passengerButton(_ sender: Any) {
        
        let passengerVC = self.storyboard?.instantiateViewController(withIdentifier: "passengerVC") as! PassengerVC
        self.navigationController?.pushViewController(passengerVC, animated: true)
        
    }
    @IBOutlet weak var passengerButton: UIButton!
//    enum TableSection: Int {
//        case basicDetails = 0, emergencyDetails, nilNext, total
//    }
//    var data = [TableSection: [[String: String]]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.white 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
    @IBAction func expandTap(_ Sender: UIButton){
        self.expand = !self.expand
        self.tableView.reloadData()
    }
}

//MARK: --> Table View Data source and Delegate methods

extension ViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return expand == true ? 4 : 0
        }
        else if section == 1 {
            
            return expand == true ? 0 : 2
        }
        else if section == 2{
            return 1
        }
        else {
            return 0
        }
    }
  
    func tableView(_ tableView: UITableView,cellForRowAt indexPath: IndexPath) -> UITableViewCell{
         let sectionNumber = indexPath.section
            switch sectionNumber {
         
            case 0:
                let rowNumber = indexPath.row
                switch rowNumber {
                case 0:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "TextFields") as! TextFields
                    cell.firstName.delegate = self
                    cell.firstName.placeholder = place[indexPath.row]
                    
                     if self.dict["FirstTF"] != nil{
                        cell.firstName.text = dict["FirstTF"]
                     }
                     else{
                        cell.firstName.text = nil
                    }
                   // cell.firstName.text = dict[indexPath.row]
                    return cell
                    
                case 1:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "TextFields") as! TextFields
                    cell.firstName.delegate = self
                    cell.firstName.placeholder = place[indexPath.row]
                    
                    if self.dict["LastTF"] != nil{
                        cell.firstName.text = dict["LastTF"]
                    }
                    else{
                        cell.firstName.text = nil
                    }
                    // cell.firstName.text = dict[indexPath.row]
                    return cell
                    
                case 2:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "DOB") as! DOB
                    cell.dateTF.delegate = self
                    cell.monthTF.delegate = self
                    cell.yearTF.delegate = self
                    if self.dict["dd"] != nil{
                        cell.dateTF.text=self.dict["dd"]!
                    }
                    else{
                        cell.dateTF.text=nil
                    }
                    if self.dict["mm"] != nil{
                        cell.monthTF.text=self.dict["mm"]!
                    }
                    else{
                        cell.monthTF.text=nil
                    }
                    if self.dict["yyyy"] != nil{
                        cell.yearTF.text=self.dict["yyyy"]!
                    }
                    else{
                        cell.yearTF.text=nil
                    }
                    return cell

                default:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "Gender") as! Gender
                    return cell
            }
            case 1:
                let rowNumber = indexPath.row
                switch rowNumber {
                case 0:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "TextFields") as! TextFields
                    cell.firstName.delegate = self
                    cell.firstName.placeholder = place[2]
                    
                    if self.dict["EmergencyTF"] != nil{
                        cell.firstName.text = dict["EmergencyTF"]
                    }
                    else{
                        cell.firstName.text = nil
                    }
                    return cell
  
                default:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ContactNumber") as! ContactNumber
                    cell.contactTF.delegate = self
                    cell.contactTF.placeholder = place[3]
                    
                    if self.dict["ContactTF"] != nil{
                        cell.contactTF.text = dict["ContactTF"]
                    }
                    else{
                        cell.contactTF.text = nil
                    }
                    return cell
                }
            default :
                let cell = tableView.dequeueReusableCell(withIdentifier: "NextButton") as! NextButton
                return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if  (indexPath.section == 0 && indexPath.row == 3) {
            return 80
        }
        else if indexPath.section == 2{
            return 35
        }
        else{
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header =  tableView.dequeueReusableCell(withIdentifier: "BasicDetails") as! BasicDetails
            UIView.animate(withDuration:5, animations: { () -> Void in
                if self.expand {
                    header.expandOutlet.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 0.999))
                } else {
                    header.expandOutlet.transform = .identity
                }
            })
            return header
        }
        
        else if section == 1{
            let header = tableView.dequeueReusableCell(withIdentifier: "BasicDetails") as! BasicDetails
            header.basicDetails.text = "Emergency Details"
            UIView.animate(withDuration:1, animations: { () -> Void in
                if self.expand {
            header.expandOutlet.transform = .identity
                } else {
        header.expandOutlet.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * 0.999))
                }
            })
            return header
        }
            
        else{
            return nil
        }
    
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BasicDetails") as? BasicDetails else{return nil}
//        if section == 2 {
//            return nil
//        }
//        cell.basicDetails.text = "section = \(section)"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath : IndexPath){
        if editingStyle == .delete {
            place.remove(at: indexPath.row )
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
}

extension ViewController : UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let cellObject = textField.superview?.superview?.superview as! UITableViewCell
        let tableObject = cellObject.superview as! UITableView
        let tableIndex = tableObject.indexPath(for: cellObject)
        let sectionIndex = tableIndex?.section
        let rowIndex = tableIndex?.row
        if sectionIndex == 0 && rowIndex == 2{
        let cell = textField.superview?.superview?.superview as! DOB
        let TF = textField
        if TF == cell.dateTF{
            let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
            
            if newString.characters.count > 2 {
                return false
            }
        }
        else if TF == cell.monthTF{
            let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
            
            if newString.characters.count > 2 {
                return false
            }
        }
        else{
            let newString = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
            
            if newString.characters.count > 4 {
                return false
            }
        }
    }
         return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let cellObject = textField.superview?.superview?.superview as! UITableViewCell
        let tableObject = cellObject.superview as! UITableView
        let tableIndex = tableObject.indexPath(for: cellObject)
        let sectionIndex = tableIndex?.section
        let rowIndex = tableIndex?.row
        
        switch sectionIndex {
        case 0?:
            switch rowIndex{
            case 0?:
                dict["FirstTF"] = textField.text
                if (textField.text?.isEmpty)!{
                alert(alertname: "First Name can't be empty")
                }
                else if ((limit(20, textField.text!))){
                alert(alertname: "First name cannot be more than 20 letters")
                
                }
            case 1?:

                dict["LastTF"] = textField.text
                if (textField.text?.isEmpty)!{
                alert(alertname: "Last Name can't be empty")
                }
                else if ((limit(20, textField.text!))){
                alert(alertname: "Last name cannot be more than 20 letters")
                }
            
            case 2?:
                let TF = textField
                let cell = textField.superview?.superview?.superview as! DOB
                if TF == cell.dateTF{
                dict["dd"] = textField.text
                if (TF.text?.isEmpty)!{
                    alert(alertname: "Day can't be empty")
                }
                }
                else if TF == cell.monthTF{
                dict["mm"] = textField.text
                if (TF.text?.isEmpty)!{
                    alert(alertname: "Month can't be empty")
                }
                }
                else{
                dict["yyyy"] = textField.text
                if (TF.text?.isEmpty)!{
                    alert(alertname: "Year can't be empty")
                }
                }
               
            default: alert(alertname: "Nothing")
            }
        case 1?:
            switch rowIndex {
            case 0?:
                dict["EmergencyTF"] = textField.text
                if (textField.text?.isEmpty)!{
                alert(alertname: "This field can't be empty")
                }
                else if ((limit(40, textField.text!))){
                alert(alertname: "First name cannot be more than 40 letters")
                }
            case 1?:
                dict["ContactTF"] = textField.text
                if (textField.text?.isEmpty)!{
                alert(alertname: "Contact number can't be empty")
                }
                else if ((limit(10, textField.text!))){
                alert(alertname: "Please enter a valid mobile number")
                }
            default: alert(alertname: "Nothing")
            }
        default : alert(alertname: "Nothing")
        }
        
    }

func limit(_ value : Int, _ counter : String)-> Bool
{
    if counter.count > value {
        return true }
    return false
}

    func alert(alertname: String){
        let alert = UIAlertController(title: "Alert !", message: alertname, preferredStyle: UIAlertControllerStyle.alert)
        let OkAction = UIAlertAction(title: "OK", style: .default){
            (action: UIAlertAction!) in print("OK button tapped")
        }
        alert.addAction(OkAction)
        UIApplication.shared.keyWindow?.rootViewController?.present( alert,animated: true, completion: nil)
        return
    }

}



