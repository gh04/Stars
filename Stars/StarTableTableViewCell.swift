//
//  StarTableTableViewCell.swift
//  Stars
//
//  Created by Gerardo Hernandez on 12/5/19.
//  Copyright © 2019 Gerardo Hernandez. All rights reserved.
//

import UIKit

class StarTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    
    //whenever start is set update the views
    //we dont have a func of update views. That's why there's a private func below
    var star: Star? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        //dont need optional chaining when star is safely unwrapped
        guard let star = star else { return }
        nameLabel.text = star.name
        distanceLabel.text = "\(star.distance) light years away"
    }
 
}
