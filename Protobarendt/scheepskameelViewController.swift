//
//  scheepskameelViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 07-09-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit



class scheepskameelViewController: UIViewController {

    @IBOutlet var scoreLabel: UILabel!

    @IBAction func swipeRight(sender: AnyObject) {
        performSegueWithIdentifier("toFormer", sender: self)
    }

    @IBAction func swipeLeft(sender: AnyObject) {
        performSegueWithIdentifier("toNext", sender: self)
    }
    @IBOutlet var opdrachtLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        opdrachtLabel.text = "Zie de scheepskamelen als twee balken aan weerszijden van het schip met een afmeting van 50 x 5 x 5 meter. Om De Gouden Buis hoog genoeg op te tillen moet het waterpeil in de kamelen 1,5 meter dalen."
        

        scoreLabel.textColor = UIColor.blackColor()
        scoreLabel.text = "score \(score)"
        scoreLabel.layer.cornerRadius = 3
        scoreLabel.layer.masksToBounds = true

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
