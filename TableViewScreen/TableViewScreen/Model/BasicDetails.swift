//
//  BasicDetails.swift
//  TableViewScreen
//
//  Created by Appinventiv on 22/02/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class BasicDetails: UITableViewCell {

    @IBOutlet weak var expandOutlet: UIButton!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var basicView: UIView!
    @IBOutlet weak var basicDetails: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
  //    self.basicView.layer.masksToBounds = false
        self.lineView.layer.shadowColor = UIColor.black.cgColor;
        self.lineView.layer.shadowOffset = CGSize.zero
        self.lineView.layer.shadowOpacity = 0.4
        self.basicView.layer.shadowRadius = 5
      
        self.basicView.layer.shadowColor = UIColor.black.cgColor;
        self.basicView.layer.shadowOffset = CGSize.zero
        self.basicView.layer.shadowOpacity = 0.4
        self.basicView.layer.shadowRadius = 5
        
        self.basicView.layer.cornerRadius = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
