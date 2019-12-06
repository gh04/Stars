//
//  StarTableTableViewCell.swift
//  Stars
//
//  Created by Gerardo Hernandez on 12/5/19.
//  Copyright © 2019 Gerardo Hernandez. All rights reserved.
//

import UIKit

class StarTableTableViewCell: UITableViewCell {

    
    var star: Star? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let star = star else { return }
        nameLabel.text = star.name
        distance.text = "\(star.distance) light years away"
    }
 
}
