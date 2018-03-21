//
//  ContactNumber.swift
//  TableViewScreen
//
//  Created by Appinventiv on 23/02/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ContactNumber: UITableViewCell {

    @IBOutlet weak var contactView: UIView!
    
    @IBOutlet weak var contactTF: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contactView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.contactView.layer.shadowOffset = CGSize.zero
        self.contactView.layer.shadowOpacity = 0.4
        self.contactView.layer.shadowRadius = 5
        self.contactView.layer.cornerRadius = 3
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
