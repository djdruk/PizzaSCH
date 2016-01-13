//
//  pizzaViewController.swift
//  PizzáSCH
//
//  Created by Zsombor Fedor on 12/6/15.
//  Copyright © 2015 Zsombor Fedor. All rights reserved.
//

import UIKit
import Parse

class pizzaViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    var selectedPizza = 0
    var selectedSize = 0
    var selectedTime = 1
    
    let timeArray = ["18:00-18:30", "18:30-19:00", "19:00-19:30", "19:30-20:00", "20:00-20:30", "20:30-21:00", "21:00-21:30", "21:30-22:00", "22:00-22:30", "22:30-23:00", "23:00-23:30"]
    
    let sizeArray = ["32", "50"]
    
     let pizzaArray = ["?????", "Albínó Batman", "Almageddon", "HaHaA", "Hawaii", "Joker", "Kusza", "Magyaros", "MC Star", "Ördög :)", "Randi", "Songoku", "Sonkás", "Szalámis", "YoLo"]
    
    let ingredArray = [
        "paradicsomos alap, Pick szalámi, vöröshagyma, bab, mozzarella",
        "fokhagymás alap, Pick szalámi, lilahagyma, kukorica, mozzarella",
        "mustáros alap, sonka, kukorica, alma, mozzarella",
        "paradicsomos alap, tonhal, vöröshagyma, olívabogyó, mozzarella",
        "paradicsomos alap, sonka, kukorica, ananász, mozzarella",
        "paradicsomos alap, Pick szalámi, bacon, lilahagyma, mozzarella",
        "paradicsomos alap, Pick szalámi, kukorica, mozzarella",
        "paradicsomos alap, Pick szalámi, bacon, vöröshagyma, erőspaprika, mozzarella",
        "mustáros alap, bacon, sonka, lilahagyma, mozzarella",
        "erős alap, Pick szalámi, bacon, pepperóni, mozzarella",
        "fokhagymás alap, bacon, sonka, vöröshagyma, mozzarella",
        "paradicsomos alap, sonka, kukorica, friss gomba, mozzarella",
        "paradicsomos alap, sonka, paradicsom, mozzarella",
        "paradicsomos alap, Pick szalámi, paradicsom, paprika, mozzarella",
        "fokhagymás alap, sonka, paradicsom, olívabogyó, mozzarella"
    ]
    
    @IBAction func timeSliderChanged(sender: UISlider) {
        let currentValue = Int(sender.value)
        
        timeLabel.text = "\(timeArray[currentValue])"
        selectedTime = currentValue
    }
    @IBOutlet weak var commentText: UITextView!
    
    @IBOutlet weak var sizeSelector: UISegmentedControl!
    
    @IBOutlet weak var ingredLabel: UILabel!
    
    @IBAction func cancel(sender: UIButton) {
        let alert = UIAlertController(title: "Rendelésed töröltük", message: "",  preferredStyle: .Alert)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .Cancel)
            {
                action in let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("UITabBarController")
                self.presentViewController(viewController, animated: true, completion: nil)
        }
        alert.addAction(cancelAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    @IBAction func orderButton(sender: UIButton) {
        
        
        let orders = PFObject(className: "order")
        orders["name"] = PFUser.currentUser()?["name"]
        orders["time"] = timeArray[selectedTime]
        orders["room"] = PFUser.currentUser()?["room"]
        orders["pizza"] = pizzaArray[selectedPizza]
        orders["comment"] = commentText.text
        orders["size"] = sizeArray[selectedSize]
        orders.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
        }
        
        
        
        let alert = UIAlertController(title: "Sikeres rendelés!", message: "Kért pizzád a megadott idősávban az ajtódhoz megy :)",  preferredStyle: .Alert)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .Cancel)
            {
                action in let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("UITabBarController")
                self.presentViewController(viewController, animated: true, completion: nil)
        }
        alert.addAction(cancelAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
        
        
        
        

        
    
    }
    
    @IBAction func sizeSelectorChanged(sender: UISegmentedControl) {
        selectedSize = sender.selectedSegmentIndex
        
        ingredLabel.text = ingredArray[selectedPizza] + ", " + sizeArray[selectedSize] + " cm"
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        ingredLabel.text = ingredArray[selectedPizza] + ", " + sizeArray[selectedSize] + " cm"
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
