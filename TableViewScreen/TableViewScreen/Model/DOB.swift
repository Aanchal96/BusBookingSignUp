//
//  DOB.swift
//  TableViewScreen
//
//  Created by Appinventiv on 22/02/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class DOB: UITableViewCell, UITextFieldDelegate  {
    var vc = ViewController()
    
    @IBOutlet weak var dobView: UIView!
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        dateTF.delegate = self
        monthTF.delegate = self
        yearTF.delegate = self
        self.dobView.layer.masksToBounds = false
        self.dobView.layer.shadowColor = UIColor.black.cgColor;
        self.dobView.layer.shadowOffset = CGSize.zero
        self.dobView.layer.shadowOpacity = 0.4
        self.dobView.layer.shadowRadius = 5
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}

extension DOB {
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        let ddRE = "^([0][1-9]|[1-2][0-9]|[3][0-1])$"
        let mmRE = "^([0][1-9]|[1][0-2])$"
        let yyRE = "^[0-9]{4}$"
        
        if(dateTF===textField)
        {
            let dd=dateTF.text
            let ddTest = NSPredicate(format:"SELF MATCHES %@",ddRE)
            let resultday = ddTest.evaluate(with: dd)
            if resultday == true
            {
                vc.dict["dd"]=dd
                return true
            }
            else
            {
                self.alert(alertname: "Please enter valid day")
                return false
            }
        }
        else if (monthTF===textField)
        {
            let mm=monthTF.text
            let ddTest = NSPredicate(format:"SELF MATCHES %@",mmRE)
            let resultday = ddTest.evaluate(with: mm)
            if resultday == true
            {
                vc.dict["mm"]=mm
                return true
                
            }
            else
            {
                self.alert(alertname: "Please enter valid month")
                return false
            }
        }
        else if (yearTF===textField)
        {
            let yy=yearTF.text
            let ddTest = NSPredicate(format:"SELF MATCHES %@",yyRE)
            let resultday = ddTest.evaluate(with: yy)
            
            if resultday == true
            {
                vc.dict["yyyy"]=yy
                return true
                
            }
            else
            {
                self.alert(alertname: "Please enter valid year")
                return false
            }
        }
        else{
            return false
        }
    }

    func alert(alertname:String){
        let alert = UIAlertController(title: "Alert !", message: alertname, preferredStyle: UIAlertControllerStyle.alert)
        let OkAction = UIAlertAction(title: "OK", style: .default){
            (action: UIAlertAction!) in print("OK button tapped")
        }
        alert.addAction(OkAction)
        UIApplication.shared.keyWindow?.rootViewController?.present( alert,animated: true, completion: nil)
        return
    }

    
}



