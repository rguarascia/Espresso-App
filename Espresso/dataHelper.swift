//
//  dataHelper.swift
//  Espresso
//
//  Created by Ryan Guarascia on 2018-10-10.
//  Copyright © 2018 Ryan Guarascia. All rights reserved.
//

import Foundation

protocol dataProtocol: class {
    func itemsDownloaded(items: NSArray);
}

class dataHelper: NSObject, URLSessionDataDelegate {
    weak var delegate: dataProtocol!
    
    var data = Data()
    
    let urlPath: String = "localhost:3000/api/";
    
    func downloadItems() {
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) {
            (data, response, error) in
            if error != nil {
                print("Failed to get Data");
            } else {
                print("data downloaded");
                self.parseJSON(data!);
            }
        }
        task.resume();
    }
func parseJSON(_ data:Data) {
    
    var jsonResult = NSArray()
    
    do{
        jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
        
    } catch let error as NSError {
        print(error)
        
    }
    
    var jsonElement = NSDictionary()
    let datas = NSMutableArray()
    
    for i in 0 ..< jsonResult.count
    {
        
        jsonElement = jsonResult[i] as! NSDictionary
        
        let data = dataModel()
        
        //the following insures none of the JsonElement values are nil through optional binding
        if let fname = jsonElement["fname"] as? String,
            let lname = jsonElement["lname"] as? String,
            let email = jsonElement["email"] as? String,
            let username = jsonElement["username"] as? String,
            let password = jsonElement["password"] as? String,
            let company = jsonElement["company"] as? String,
            let title = jsonElement["title"] as? String,
            let url = jsonElement["url"] as? String
        {
            
            data.fname = fname
            data.lname = lname
            data.email = email
            data.username = username
            data.password = password
            data.company = company
            data.title = title
            data.url = url
            
        }
        
        datas.add(data)
        
    }
    
    DispatchQueue.main.async(execute: { () -> Void in
        
        self.delegate.itemsDownloaded(items: datas)
        
    })
}
}
