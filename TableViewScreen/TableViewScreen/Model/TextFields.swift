//
//  TextFields.swift
//  TableViewScreen
//
//  Created by Appinventiv on 22/02/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

//protocol CellDelegate {
//    func textFieldText(cell: UITableViewCell, text: String)
//}

class TextFields: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var textView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textView.layer.masksToBounds = false
        self.textView.layer.shadowColor = UIColor.black.cgColor;
        self.textView.layer.shadowOffset = CGSize.zero
        self.textView.layer.shadowOpacity = 0.4
        self.textView.layer.shadowRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
//  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//  let result = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string
//  delegate.textFieldText(self, text: result)
//  }
    }
}
