//
//  ScheepskameelAnimationViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 08-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit

class ScheepskameelAnimationViewController: UIViewController {
    
    var counter = 1
    var textArr = ["Scheepskamelen zijn eigenlijk 2 enorme holle, houten balken die men eerst vol met water laat lopen, zodat ze zinken en nog maar net boven het wateroppervlak uitkomen.", "Vervolgens, worden deze scheepskamelen stevig aan de zijkant van het schip vastgemaakt.", "De grote truc is nu dat, als je het water uit de scheepskamelen laat lopen, ze automatisch uit het water omhoog komen en zo het hele schip optillen. Op die manier konden ze vroeger toch over ondiepe wateren varen!"]
  
    
    @IBOutlet var volgende: UIButton!
    @IBOutlet var labelText: UILabel!
    @IBOutlet var scheepsImage: UIImageView!
    @IBAction func swipeleft(sender: AnyObject) {
        nextButton(self)
    }
    @IBAction func nextButton(sender: AnyObject) {

        //maakt een crossfade (crossdisolve) op basis van div images in 1 imageview!
        counter++
        let toImage = UIImage(named:"scheeps\(counter).png")
        if counter < 4 {
        UIView.transitionWithView(self.scheepsImage,
            duration:1.5,
            options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: { self.scheepsImage.image = toImage },
            completion: nil)
            labelText.text = textArr[counter - 1]
            
            
        } else if counter == 4 {
            self.performSegueWithIdentifier("naarOpdrachtScheepskameel", sender: nil)
            
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scheepsImage.image = UIImage(named: "scheeps1.png")
        labelText.text = textArr[0]
        volgende.layer.cornerRadius = 3
        volgende.layer.shadowColor = UIColor.grayColor().CGColor
        volgende.layer.shadowOpacity = 0.8
        volgende.layer.shadowOffset = CGSizeMake(2.0, 2.0)

 
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
