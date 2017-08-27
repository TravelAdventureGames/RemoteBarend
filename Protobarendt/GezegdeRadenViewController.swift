//
//  GezegdeRadenViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 12-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit

class GezegdeRadenViewController: UIViewController {
    


    var ansGiven = false
    var buttonTapped = false

    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var ant1Label: UIButton!
    @IBOutlet var ant2Label: UIButton!
    @IBOutlet var ant3Label: UIButton!
    @IBOutlet var gezegdeLabel: UILabel!

    

    @IBAction func buttonFalse1(sender: AnyObject) {



        MyPlayer.playIt("error", ext: "wav")
        

        
    }
    

    @IBAction func buttonGoed(sender: AnyObject) {

        score =  score + 10


        MyPlayer.playIt("win", ext: "wav")
    }
    
    @IBAction func buttonFalse2(sender: AnyObject) {
        ansGiven = true

        MyPlayer.playIt("error", ext: "wav")
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "bestestuurlui.png")
        
        scoreLabel.text = "Score \(score)"
        scoreLabel.layer.cornerRadius = 3
        scoreLabel.layer.masksToBounds = true
        gezegdeLabel.text = "Wisten jullie dat ontzettend veel spreekwoorden en gezegden afkomstig zijn uit de scheepvaart! Welk spreekwoord wordt hier uitgebeeld? Heb je het goed dan verdien je 10 florijnen!"
   
        ant3Label.layer.cornerRadius = 5
        ant3Label.backgroundColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 0.8)
        ant3Label.layer.shadowColor = UIColor.grayColor().CGColor
        ant3Label.layer.shadowOpacity = 1.0
        ant3Label.layer.shadowOffset = CGSizeMake(1.0, 1.0)
        ant3Label.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        ant3Label.titleLabel!.font = UIFont(name: "Helveticaneue-Bold", size: 14)
        ant3Label.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Center
        ant3Label.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        ant3Label.titleLabel?.textAlignment = NSTextAlignment.Center
        ant3Label.setTitle("Al is een kapitein een grote kwal\nhij hoort niet thuis op de wal", forState: UIControlState.Normal)

        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

