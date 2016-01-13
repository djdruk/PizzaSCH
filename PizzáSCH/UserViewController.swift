//
//  UserViewController.swift
//  PizzáSCH
//
//  Created by Zsombor Fedor on 12/5/15.
//  Copyright © 2015 Zsombor Fedor. All rights reserved.
//

import UIKit
import Parse

class UserViewController: UIViewController {
  
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var roomField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var profileImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let pUserName = PFUser.currentUser()?["username"] as? String {
            self.usernameLabel.text = "@" + pUserName
        }
        
        if let userPicture = PFUser.currentUser()?["picture"] as? PFFile {
            userPicture.getDataInBackgroundWithBlock { (imageData: NSData?, error: NSError?) -> Void in
                if (error == nil) {
                    self.profileImage.image = UIImage(data:imageData!)
                }
            }
        }
        
        if let pEmail = PFUser.currentUser()?["email"] as? String {
            self.emailLabel.text = pEmail
        }
        
        if let pName = PFUser.currentUser()?["name"] as? String {
            self.nameLabel.text = pName
        }
        
        if let pRoom = PFUser.currentUser()?["room"] as? Int {
            self.roomField.text = String(pRoom)
        }
        
        if let pPhone = PFUser.currentUser()?["phone"] as? String {
            self.phoneField.text = pPhone
        }
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButton(sender: AnyObject) {
        
        PFUser.currentUser()?["room"] = Int(roomField.text!)
        
        PFUser.currentUser()?["phone"] = phoneField.text!
        
       
        
        
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
