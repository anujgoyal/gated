//
//  GatedDetailViewController.swift
//  gated
//
//  Created by Anuj Goyal on 10/17/14.
//  Copyright (c) 2014 TXT2LRN. All rights reserved.
//

import UIKit

class GatedDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
//    var foo: NSDictionary
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var url = "http://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Meg_Whitman_crop.jpg/200px-Meg_Whitman_crop.jpg"
        // Do any additional setup after loading the view.  
        imageView.contentMode = UIViewContentMode.ScaleAspectFit
        // imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.setImageWithURL(NSURL(string: url))
        
        
        // http://stackoverflow.com/questions/12789013/ios-multi-line-uilabel-in-auto-layout
        // 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
