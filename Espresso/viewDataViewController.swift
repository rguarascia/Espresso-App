//
//  viewDataViewController.swift
//  Espresso
//
//  Created by Ryan Guarascia on 2018-10-10.
//  Copyright © 2018 Ryan Guarascia. All rights reserved.
//

import UIKit

class viewDataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, dataProtocol {
    
    @IBOutlet weak var listTableView: UITableView!
    
    var feedItems: NSArray = NSArray();
    var selectedRow : dataModel = dataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.listTableView.delegate = self
        self.listTableView.dataSource = self
        
        let DataHelper = dataHelper();
        DataHelper.delegate = self;
        DataHelper.downloadItems()
    }
    
    func itemsDownloaded(items: NSArray) {
        feedItems = items;
        self.listTableView.reloadData();
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
        let cellIdentifier: String = "BasicCell"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)!
        // Get the location to be shown
        let item: dataModel = feedItems[indexPath.row] as! dataModel
        // Get references to labels of cell
        myCell.textLabel!.text = item.username! + " - " + item.fname! + " " + item.lname!;
        
        return myCell
    }
    
    
}
