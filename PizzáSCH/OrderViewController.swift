//
//  OrderViewController.swift
//  PizzáSCH
//
//  Created by Zsombor Fedor on 11/29/15.
//  Copyright © 2015 Zsombor Fedor. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    var selectedPizza = 0
    
    var pickerData: [String] = [String]()
    
    @IBOutlet weak var pizzaPicker: UIPickerView!
    
    func numberOfComponentsInPickerView(_pickerView: UIPickerView) -> Int {return 1}
    
    func pickerView(_pickerView: UIPickerView,
        numberOfRowsInComponent component: Int) -> Int{ return 15}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Input data into the Array:
        
        self.pizzaPicker.delegate = self
        self.pizzaPicker.dataSource = self
        
        pickerData = ["?????", "Albínó Batman", "Almageddon", "HaHaA", "Hawaii", "Joker", "Kusza", "Magyaros", "MC Star", "Ördög :)", "Randi", "Songoku", "Sonkás", "Szalámis", "YoLo"]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Catpure the picker view selection
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPizza = row
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
       
            let pizzaVC = segue.destinationViewController as! pizzaViewController
            pizzaVC.selectedPizza = selectedPizza
        
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
