//
//  mainViewController.swift
//  Espresso
//
//  Created by Ryan Guarascia on 2018-10-09.
//  Copyright © 2018 Ryan Guarascia. All rights reserved.
//

import UIKit

class mainViewController: UIViewController {

    
    @IBAction func gotoCreateAccount(_ sender: Any) {
        performSegue(withIdentifier: "gotoCreate", sender: self)
    }
    
}
