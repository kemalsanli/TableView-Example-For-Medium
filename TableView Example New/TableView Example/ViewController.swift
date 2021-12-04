//
//  ViewController.swift
//  TableView Example
//
//  Created by Kemal Sanlı on 4.12.2021.
//
//  Medium @kemalsans - medium.com/@kemalsans
// https://medium.com/@kemalsans/you-can-easily-animate-table-views-with-this-one-weird-trick-66e36ce39c5
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
        //tableView.reloadData() // Instead of reloading we will remove it from table view but this time we have indexPath
        
        tableView.deleteRows(at: [indexPath], with: .left)
        //As you remember we put indexPath in "[]" because tableView functions usually want an IndexPath array
        //We also selected .left animation
    }
    
    //Add row button
    
    @IBAction func addRowButtonClicked(_ sender: Any) {
        contentArray.insert("New Row", at: 0) //We added a new item at 0 because we wanted to see row at top of tableview.
        //self.tableView.reloadData() //instead of reloading, we can add it to tableview with this
        
        //First we need an indexPath before adding anything to a tableView
        //We don't have indexPath but we know we will add our row at top of tableView.
        let indexPath = IndexPath(row: 0, section: 0)
        //Row and section both 0 because, for row we need to add top of tableView this means index 0 and for section we have only one section so leave it 0.
        
        tableView.insertRows(at: [indexPath], with: .automatic)
        //This function wants indexPath array so we put our indexPath in "[]"
        //With .automatic can be changed you have several options like left right etc.
    }
    
    
    
}


