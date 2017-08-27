//
//  TeamnaamViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 05-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit

class TeamnaamViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var label: UILabel!
    

    @IBOutlet var teamNaam: UITextField!
    
    @IBAction func buttonTapped(sender: AnyObject) {
        
        
        if teamNaam.text == ""  {
            
            let alert1 = UIAlertController(title: "Hey jongens en meiden", message: "Jullie hebben geen teamnaam ingevuld!", preferredStyle: UIAlertControllerStyle.Alert)
            alert1.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                //self.dismissViewControllerAnimated(true, completion: nil)
                
            }))
            
            
            self.presentViewController(alert1, animated: true, completion: nil)
            
        } else {
            
            teamNaamGegeven = teamNaam.text!
            performSegueWithIdentifier("toCamera", sender: nil)

        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.teamNaam.delegate = self
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: "didTapView")
        self.view.addGestureRecognizer(tapRecognizer)

        label.text = "Met de eerste opdracht hebben jullie \(score) florijnen binnengehaald! Verdien in totaal 160 florijnen om Barendt vrij te kopen van zielverkoopster Griet. Dit kan door de opdrachten in dit spel te volbrengen. \n\nVerzin nu eerst een teamnaam en maak een mooie teamfoto (in landscape, dus houd je smartphone horizontaal!). Als kleine aanmoediging verdien je hier alvast 3 florijnen mee!"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(teamnaam: UITextField) -> Bool {
        teamNaam.resignFirstResponder()
        return true;
 
    }
    func didTapView(){
        self.view.endEditing(true)
    }
    


}
