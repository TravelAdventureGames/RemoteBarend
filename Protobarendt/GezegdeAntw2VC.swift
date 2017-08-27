//
//  GezegdeAntw2VC.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 14-01-16.
//  Copyright © 2016 Martijn van Gogh. All rights reserved.
//

import UIKit

class GezegdeAntw2VC: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var scoreLabel: ScoreLabeltje!
    
    @IBAction func swipeLeft(sender: AnyObject) {
        performSegueWithIdentifier("toNext", sender: self)
    }
    var antStatus = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI() {
        
        imageView.image = UIImage(named: "Roeienriemen4.png")
        scoreLabel.text = "Score \(score)"
        label.text = antStatus
        
   
    }
    

}
