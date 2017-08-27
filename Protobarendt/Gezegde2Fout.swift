//
//  Gezegde2Fout.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 13-01-16.
//  Copyright © 2016 Martijn van Gogh. All rights reserved.
//

import UIKit

class Gezegde2Fout: UIViewController {


    @IBOutlet var imageView: UIImageView!
    @IBOutlet var antLabel: UILabel!
    @IBOutlet var scoreLabel: ScoreLabeltje!
    
    @IBAction func swipeLeft(sender: AnyObject) {
        performSegueWithIdentifier("toNext", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "bestestuurlui2.png")
        antLabel.text = "Dat antwoord was fout! 'De beste stuurlui staan aan wal' is het juiste antwoord. Het betekent dat toeschouwers het vaak beter denken te weten dan degenen die het uitvoeren. Ga verder naar het volgende scherm dan krijg je nog een kans voor 10 punten!"
        scoreLabel.text = "Score \(score)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
