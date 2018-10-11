//
//  mainViewController.swift
//  Espresso
//
//  Created by Ryan Guarascia on 2018-10-09.
//  Copyright © 2018 Ryan Guarascia. All rights reserved.
//

import UIKit

class mainViewController: UIViewController, dataProtocol {
    var feedItems: NSArray = NSArray();
    var selectedRow : dataModel = dataModel()
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    func itemsDownloaded(items: NSArray) {
        feedItems = items;
    }
    
    @IBAction func login(_ sender: Any) {
        errorLabel.text = "";
        for item in feedItems {
            let x: dataModel = item as! dataModel
            
            if(username.text != "" || password.text != "") {
                if(x.username! == username.text! && x.password! == password.text!) {
                    errorLabel.text = "Log in successful";
                    break;
                } else {
                    errorLabel.text = "Username and or password incorrect";
                }
            } else {
                errorLabel.text = "Username or password empty";
            }
        }
    }
    
    
    @IBAction func gotoCreateAccount(_ sender: Any) {
        performSegue(withIdentifier: "gotoCreate", sender: self);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        let DataHelper = dataHelper();
        DataHelper.delegate = self;
        DataHelper.downloadItems();
    }
    
    @IBAction func gotoView(_ sender: Any) {
        performSegue(withIdentifier: "viewData", sender: self);
    }
}
