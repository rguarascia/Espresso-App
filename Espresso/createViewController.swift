//
//  createViewController.swift
//  Espresso
//
//  Created by Ryan Guarascia on 2018-10-09.
//  Copyright © 2018 Ryan Guarascia. All rights reserved.
//

import UIKit

class createViewController: UIViewController {
    
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var jobTitle: UITextField!
    @IBOutlet weak var website: UITextField!
    @IBOutlet weak var agreed: UISwitch!
    
    @IBAction func createAccount(_ sender: Any) {
        
        if(fname.text?.isEmpty ?? true) {
            fname.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.3);
        } else {
            fname.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3);
        }
        
        if(lname.text?.isEmpty ?? true) {
            lname.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.3);
        } else {
            lname.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3);
        }
        
        if(email.text?.isEmpty ?? true) {
            email.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.3);
        } else {
            email.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3);
        }
        
        if(username.text?.isEmpty ?? true) {
            username.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.3);
        } else {
            username.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3);
        }
        
        if(password.text?.isEmpty ?? true) {
            password.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.3);
        } else {
            password.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3);
        }
        
        if(company.text?.isEmpty ?? true) {
            company.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.3);
        } else {
            company.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3);
        }
        
        if(jobTitle.text?.isEmpty ?? true) {
            jobTitle.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.3);
        } else {
            jobTitle.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3);
        }
        
        if(website.text?.isEmpty ?? true) {
            website.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.3);
        } else {
            website.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3);
        }
        
        if(!(fname.text?.isEmpty ?? true && lname.text?.isEmpty ?? true && email.text?.isEmpty ?? true &&
            username.text?.isEmpty ?? true && password.text?.isEmpty ?? true && jobTitle.text?.isEmpty ?? true &&
            website.text?.isEmpty ?? true)) {
            
            submit();
        }
    }
    func submit() {
        print("Submitting");
        //declare parameter as a dictionary which contains string as key and value combination. considering inputs are valid
        
        let parameters = ["fname": fname.text!, "lname": lname.text!, "email": email.text!, "username": username.text!, "password": password.text!,
                                 "company": company.text!, "title": jobTitle.text!, "url": website.text!]
        
        //let urlPath: String = "http://espresso-testing-espresso.7e14.starter-us-west-2.openshiftapps.com/api/";
         let url = URL(string: "http://localhost:3000/api/")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    // handle json...
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
}
