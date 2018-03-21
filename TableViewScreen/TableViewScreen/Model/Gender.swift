//
//  Gender.swift
//  TableViewScreen
//
//  Created by Appinventiv on 22/02/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class Gender: UITableViewCell {

    @IBOutlet weak var genderView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.genderView.layer.masksToBounds = false
        self.genderView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.genderView.layer.shadowOffset = CGSize.zero
        self.genderView.layer.shadowOpacity = 0.4
        self.genderView.layer.shadowRadius = 5
        self.genderView.layer.cornerRadius = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
