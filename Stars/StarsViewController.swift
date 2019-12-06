//
//  StarsViewController.swift
//  Stars
//
//  Created by Gerardo Hernandez on 12/5/19.
//  Copyright © 2019 Gerardo Hernandez. All rights reserved.
//

import UIKit

class StarsViewController: UIViewController {
    
    // Mark: - IBOutlets
    @IBOutlet weak var distanceTextField: UILabel!
    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // calling to
    //array of stars
    //
    let starController = StarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Maal
    
    @IBAction func createStar(_ sender: UIButton) {
        guard let name = nameTextField.text,
            let distanceString = distanceTextField.text,
            //making sure the value is not empty
            !name.isEmpty,
            !distanceString.isEmpty,
            let distance = Double(distanceString) else { return }
        
        starController.createStar(named: name, withDistance: distance)
        nameTextField.text = ""
              distanceTextField.text = ""
              nameTextField.becomeFirstResponder()
              tableView.reloadData()
        
    }
    
}

    

extension StarsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starController.stars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StarCell", for: indexPath) as? StarTableViewCell else {return UITableViewCell() }
        
        let star = starController.stars[indexPath.row]
        cell.star = star
        return cell
    }
    

    }

   
    

  

