//
//  ViewController.swift
//  gated
//
//  Created by Anuj Goyal on 10/16/14.
//  Copyright (c) 2014 TXT2LRN. All rights reserved.
//

import UIKit

class GatedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var gatedDT: [NSDictionary] = []
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // set title
        self.title = "Contacts"

        // get data
        getData()
    }

    func getData() {
        NSLog("getData called")
        var url = "http://goanuj.freeshell.org/ios/gated.json"
        var request = NSURLRequest(URL: NSURL(string: url))
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue() ) {
            (response: NSURLResponse!, urlData: NSData!, error: NSError!) -> Void in
            
            if urlData != nil {
                var err: NSError?
                if let object = (NSJSONSerialization.JSONObjectWithData(urlData,
                    options: nil, error: &err) as? NSDictionary) {
                    
                    //NSLog("object valid: \(object)")
                    // data was returned, populate dictionary
                    self.gatedDT = object["gated_contacts"] as [NSDictionary]
                    //var g = self.gatedDT[0]
                    //NSLog("0: \(g)")
                } else {
                    NSLog("object NOT valid")
                }
                self.tableView.reloadData()
//                self.refreshControl.endRefreshing()
            } else {
                // network error
                NSLog("network error")
            }
            //println("object = \(object)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gatedDT.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("GatedCell") as GatedCell

        var gated = self.gatedDT[indexPath.row]
        
        cell.nameLabel.text = gated["name"] as? String
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        //
        var name = self.gatedDT[indexPath.row]["name"] as? String
        NSLog("didSelect: \(name)")
        
        //var rootViewController = self.window!.rootViewController as UINavigationController
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var detailVC = mainStoryboard.instantiateViewControllerWithIdentifier("GatedDetailViewController") as GatedDetailViewController
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

