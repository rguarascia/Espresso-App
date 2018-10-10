//
//  dataModel.swift
//  Espresso
//
//  Created by Ryan Guarascia on 2018-10-10.
//  Copyright © 2018 Ryan Guarascia. All rights reserved.
//

import Foundation

class dataModel: NSObject {
    var fname: String?
    var lname: String?
    var email: String?
    var username: String?
    var password: String?
    var company: String?
    var title: String?
    var url: String?
    
    override init() {
    }
    
    init(fname: String, lname: String, email: String, username: String, password: String, company: String, title: String, url: String) {
        self.fname = fname;
        self.lname = lname;
        self.email = email;
        self.username = username;
        self.password = password;
        self.company = company;
        self.title = title;
        self.url = url;
    }
    
    override var description: String {
        return "FName: \(fname) LName: \(lname) Email: \(email) Username:  \(username) Password: \(password) Company: \(company) Title: \(title) URL: \(url)";
    }
}
