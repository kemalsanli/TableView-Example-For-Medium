//
//  ViewController.swift
//  TableView Example
//
//  Created by Kemal Sanlı on 4.12.2021.
//
//  Medium @kemalsans - medium.com/@kemalsans
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    //Added TableView Protocols

    @IBOutlet weak var tableView: UITableView! //TableView Connected
    
    
    var contentArray = [String]() //Content array created
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for element in 0...50{
            contentArray.append("\(element)") // Int to String, because we have string array.
        }
        
        //Added delegate and datasource
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    }
    
    //TableView Protocol Stubs
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = contentArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        contentArray.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    //Add row button
    
    @IBAction func addRowButtonClicked(_ sender: Any) {
        contentArray.insert("New Row", at: 0) //We added a new row at 0 because we wanted to see row at top of tableview.
        self.tableView.reloadData()
    }
    
    
    
}


