//
//  NewsViewController.swift
//  PizzáSCH
//
//  Created by Zsombor Fedor on 12/17/15.
//  Copyright © 2015 Zsombor Fedor. All rights reserved.
//

import UIKit
import Parse


class NewsViewController: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let objectId = "IQ5cg8yz95"
        
        
        let query = PFQuery(className:"news")
        
        
        
        let object = try! query.getObjectWithId(objectId)
        
        textLabel.text  = String(object.objectForKey("text")!)
    
        let date : String = String(object.objectForKey("date")!)
        
        headerLabel.text = date.substringToIndex(date.endIndex.advancedBy(-15)) + " - " + String(object.objectForKey("header")!)
        
    
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
