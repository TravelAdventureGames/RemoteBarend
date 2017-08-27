//
//  overOostindischViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 26-11-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit

class overOostindischViewController: UIViewController {

    var textArr = ["Jullie zijn aangekomen bij het Oost-Indisch Huis, het hoofdkantoor van de VOC. Op de binnenplaats vindt de aanmonstering van geronselde zeemannen plaats. Als er een VOC-vloot op het punt staat de reis naar de Oost te gaan maken, leidt dit vaak tot chaotische taferelen.", "Zielverkopers als Griet trekken met hun ‘gevangenen’ naar de plek waar jullie nu staan. Als het hek opengaat begint het gevecht om het gebouw binnen te komen en een plaats op één van de schepen te bemachtigen. Vaak mondt dit uit in een complete bestorming waarbij rake klappen uitgedeeld worden."]
    
    
    @IBOutlet var buttLabel: UIButton!
    var counter = 1
    
    
    @IBOutlet var labelText: UILabel!
    @IBOutlet var imageSchreiers: UIImageView!
    
    @IBAction func swipeLeft(sender: AnyObject) {
        buttonPressed(self)
    }
    @IBAction func buttonPressed(sender: AnyObject) {
        counter++
        
        if counter < 3 {
            
            //maakt een crossfade (crossdisolve) op basis van div images in 1 imageview!
            
            let toImage = UIImage(named:"indisch\(counter).jpg")
            
            UIView.transitionWithView(self.imageSchreiers,
                duration:1.5,
                options: UIViewAnimationOptions.TransitionCrossDissolve,
                animations: { self.imageSchreiers.image = toImage },
                completion: nil)
            labelText.text = textArr[counter - 1]
            
            
        } else if counter == 3 {
            self.performSegueWithIdentifier("toOostind", sender: nil)
            
            
            
            
        }
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSchreiers.image = UIImage(named: "indisch1.jpg")
        labelText.text = textArr[counter - 1]
        buttLabel.layer.cornerRadius = 3
        buttLabel.layer.shadowColor = UIColor.grayColor().CGColor
        buttLabel.layer.shadowOpacity = 0.8
        buttLabel.layer.shadowOffset = CGSizeMake(1.0, 1.0)
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    


}
