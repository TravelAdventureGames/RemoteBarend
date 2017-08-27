//
//  LiefdesbrugViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 09-11-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation

class LiefdesbrugViewController: UIViewController {



    @IBOutlet var imageSchreiers: UIImageView!
    @IBOutlet var volgendeButt: UIButton!
    @IBOutlet var whatsappImage: UIImageView!
    @IBAction func swipeLeft(sender: AnyObject) {
        self.performSegueWithIdentifier("toBrugopdracht", sender: nil)
    }
    @IBAction func buttonPressed(sender: AnyObject) {
        

            self.performSegueWithIdentifier("toBrugopdracht", sender: nil)
    
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        volgendeButt.layer.cornerRadius = 5
        volgendeButt.layer.shadowColor = UIColor.grayColor().CGColor
        volgendeButt.layer.shadowOpacity = 0.8
        volgendeButt.layer.shadowOffset = CGSizeMake(1.0, 1.0)
        imageSchreiers.image = UIImage(named: "staalmeestersbrug.jpg")

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
 
        
        whatsappImage.image = UIImage(named: "aaltjeslotMess1.png")
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
            initialSpringVelocity: 4.0, options: [], animations:
            {
                self.whatsappImage.center = CGPointMake(self.whatsappImage.center.x - 400, self.whatsappImage.center.y)
                
               MyPlayer.playIt("Aaltje", ext: "mp3")
                
            }, completion: nil)
        
    }

}
