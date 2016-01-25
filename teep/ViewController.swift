//
//  ViewController.swift
//  teep
//
//  Created by Vicki Tan on 1/19/16.
//  Copyright © 2016 Vicki Tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var faceImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "0.00"
        totalLabel.text = "0.00"
        
        onTipPercentageChange(self)
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTipPercentageChange(sender: AnyObject) {
        
        var tipPercentages = [0.10, 0.15, 0.20, 0.25, 1.0]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        if (tipPercentage == tipPercentages[0]) {
            faceImage.alpha = 0
            faceImage.image = UIImage(named: "10.png")
            UIView.animateWithDuration(1, animations: {
                self.faceImage.alpha = 1
            })
        } else if (tipPercentage == tipPercentages[1]) {
            faceImage.alpha = 0
            faceImage.image = UIImage(named: "15.png")
            UIView.animateWithDuration(1, animations: {
                self.faceImage.alpha = 1
            })
        } else if (tipPercentage == tipPercentages[2]) {
            faceImage.alpha = 0
            faceImage.image = UIImage(named: "20.png")
            UIView.animateWithDuration(1, animations: {
                self.faceImage.alpha = 1
            })
        } else if (tipPercentage == tipPercentages[3]) {
            faceImage.alpha = 0
            faceImage.image = UIImage(named: "25.png")
            UIView.animateWithDuration(1, animations: {
                self.faceImage.alpha = 1
            })
        } else if (tipPercentage == tipPercentages[4]) {
            faceImage.alpha = 0
            faceImage.image = UIImage(named: "100.png")
            UIView.animateWithDuration(1, animations: {
                self.faceImage.alpha = 1
            })
        }
    }
    
    @IBAction func onEditingChange(sender: AnyObject) {
        
        var tipPercentages = [0.10, 0.15, 0.20, 0.25, 1.0]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "\(tip)"
        totalLabel.text = "\(total)"
        
        tipLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "%.2f",total)
        
    }

    @IBAction func onTap(sender: AnyObject) {
            view.endEditing (true)
    }
}