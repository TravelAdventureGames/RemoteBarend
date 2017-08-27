//
//  Antwoord2DamViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 18-01-16.
//  Copyright © 2016 Martijn van Gogh. All rights reserved.
//

import UIKit

class Antwoord2DamViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var label: UILabel!
    @IBOutlet var scoreLabel: ScoreLabeltje!

    var antStatus = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI() {
        
        imageView.image = UIImage(named: "damSchavot.jpg")
        scoreLabel.text = "Score \(score)"
        label.text = antStatus
        
        
    }
        func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Left:
                performSegueWithIdentifier("toNext", sender: self
)
            default:
                break
            }
        }
    }

}
