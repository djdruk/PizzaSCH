//
//  LoginViewController.swift
//  PizzáSCH
//
//  Created by Zsombor Fedor on 11/6/15.
//  Copyright © 2015 Zsombor Fedor. All rights reserved.
//

import UIKit
import Parse



class LoginViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(sender: AnyObject) {
        let username = self.userTextField.text
        let password = self.passTextField.text
        
        
            // Run a spinner to show a task in progress
            let spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
            spinner.startAnimating()
            
            // Send a request to login
            PFUser.logInWithUsernameInBackground(username!, password: password!, block: { (user, error) -> Void in
                
                // Stop the spinner
                spinner.stopAnimating()
                
                if ((user) != nil) {
                
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("UITabBarController")
                        self.presentViewController(viewController, animated: true, completion: nil)
                    })
                    
                } else {
                
                    let alert = UIAlertController(title: "Hiba", message: "\(error)",  preferredStyle: .Alert)
            
                    let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .Cancel)
                    {
                        action -> Void in
                    }
                    alert.addAction(cancelAction)
                    
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            })
        
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
