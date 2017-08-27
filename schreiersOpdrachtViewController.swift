//
//  schreiersOpdrachtViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 10-09-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation

class schreiersOpdrachtViewController: UIViewController {
    var ansGiven = false
    var audioPLayer = AVAudioPlayer()
    var myString = "'Mijn tandvlees bloedt als de neten en ik heb ook een aantal bloedrode vlekken op mijn onderbenen, die trouwens slap voelen en hartstikke veel pijn doen, vooral ’s nachts. Help me!' \n\rHoe zouden jullie Barendt's kwalen behandelen? Kies het goede antwoord en verdien 10 florijnen!"
    var myMutableString = NSMutableAttributedString()
    @IBOutlet var scoreLabel: UILabel!

    @IBOutlet var scheurbuik: UIImageView!
    @IBOutlet var volgende: UIBarButtonItem!
    var counter = 0
    @IBOutlet var butt1label: UIButton!
    @IBOutlet var whatsappImage: UIImageView!

    @IBOutlet var butt4label: UIButton!
    @IBOutlet var butt2label: UIButton!
    @IBOutlet var butt3label: UIButton!
    
    
    @IBAction func swipeLeft(sender: AnyObject) {
        
        if ansGiven == true {
            self.performSegueWithIdentifier("toNext", sender: self)
        }
    }
    

    @IBAction func butt1(sender: AnyObject) {
        ansGiven = true
        whatsappImage.image = UIImage(named: "aaltjeschrFout.png")
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
            initialSpringVelocity: 4.0, options: [], animations:
            {
                self.whatsappImage.center = CGPointMake(self.whatsappImage.center.x - 400, self.whatsappImage.center.y)
                
                MyPlayer.playIt("error", ext: "wav")
                
            }, completion: nil)

        
            //vraagLabel.text = "'Tja, jullie hebben bij het verkeerde eind.. Het lijkt erop dat onze held Barendt scheurbuik heeft. Een gevaarlijke ziekte die wordt veroorzaakt door een groot gebrek aan vitamine C. Het is daarom het beste om Barendt verse groenten en fruit te geven. Geen florijnen verdiend!'"
            butt1label.hidden = true
            butt2label.hidden = true
            butt3label.hidden = true
            butt4label.hidden = true
            volgende.enabled = true
            scheurbuik.image = UIImage(named: "scheurbuik.png")
            
        
    }

    @IBAction func butt2(sender: AnyObject) {
        ansGiven = true
        whatsappImage.image = UIImage(named: "aaltjeschrFout.png")
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
            initialSpringVelocity: 4.0, options: [], animations:
            {
                self.whatsappImage.center = CGPointMake(self.whatsappImage.center.x - 400, self.whatsappImage.center.y)
                
                MyPlayer.playIt("error", ext: "wav")
                
            }, completion: nil)

        
            //vraagLabel.text = "'Tja, jullie hebben bij het verkeerde eind.. Het lijkt erop dat onze held Barendt scheurbuik heeft. Een gevaarlijke ziekte die wordt veroorzaakt door een groot gebrek aan vitamine C. Het is daarom het beste om Barendt verse groenten en fruit te geven. Geen florijnen verdiend!'"
            butt1label.hidden = true
            butt2label.hidden = true
            butt3label.hidden = true
            butt4label.hidden = true
            volgende.enabled = true
            scheurbuik.image = UIImage(named: "scheurbuik.png")
            
        
    }
    
    @IBAction func butt3(sender: AnyObject) {
        ansGiven = true
        whatsappImage.image = UIImage(named: "aaltjeschrFout.png")
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
            initialSpringVelocity: 4.0, options: [], animations:
            {
                self.whatsappImage.center = CGPointMake(self.whatsappImage.center.x - 400, self.whatsappImage.center.y)
                
                MyPlayer.playIt("error", ext: "wav")
                
            }, completion: nil)
            
            //vraagLabel.text = "'Tja, jullie hebben bij het verkeerde eind.. Het lijkt erop dat onze held Barendt scheurbuik heeft. Een gevaarlijke ziekte die wordt veroorzaakt door een groot gebrek aan vitamine C. Het is daarom het beste om Barendt verse groenten en fruit te geven. Geen florijnen verdiend!'"
            butt1label.hidden = true
            butt2label.hidden = true
            butt3label.hidden = true
            butt4label.hidden = true
            volgende.enabled = true
            scheurbuik.image = UIImage(named: "scheurbuik.png")
            
        
        
    }
    @IBAction func butt4(sender: AnyObject) {
        ansGiven = true
        whatsappImage.image = UIImage(named: "aaltjeschrGoed.png")
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
            initialSpringVelocity: 4.0, options: [], animations:
            {
                self.whatsappImage.center = CGPointMake(self.whatsappImage.center.x - 400, self.whatsappImage.center.y)
                
                MyPlayer.playIt("win", ext: "wav")
                
            }, completion: nil)
            
            //vraagLabel.text = "'Verrek, jullie houden voet bij stuk! Hoe gecharmeerd ik ook van aderlaten ben; het is inderdaad de verkeerde manier. Het lijkt erop dat onze held Barendt scheurbuik heeft. Een gevaarlijke ziekte die wordt veroorzaakt door een groot gebrek aan vitamine C. Het is dus inderdaad het beste om Barendt verse groenten en fruit te geven. 10 florijnen verdiend!'"
            butt1label.hidden = true
            butt2label.hidden = true
            butt3label.hidden = true
            butt4label.hidden = true
            volgende.enabled = true
            scheurbuik.image = UIImage(named: "scheurbuik.png")
            score = score + 10
            scoreLabel.text = "Score \(score)"
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score \(score)"
     
        //vraagLabel.text = myString
        
        butt1label.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        butt1label.titleLabel?.textAlignment = NSTextAlignment.Center
        butt1label.setTitle("Kies aderlaten! Hierbij wordt\nbloed afgetapt van de patiënt.", forState: UIControlState.Normal)
        butt1label.layer.cornerRadius = 3
        butt1label.layer.shadowColor = UIColor.grayColor().CGColor
        butt1label.layer.shadowOpacity = 0.7
        butt1label.layer.shadowRadius = 3
        butt1label.layer.shadowOffset = CGSizeMake(3.0, 3.0)
        
        
        butt2label.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        butt2label.titleLabel?.textAlignment = NSTextAlignment.Center
        butt2label.setTitle("Trek al zijn tanden!\nEen ontsteking is levensgevaarlijk!", forState: UIControlState.Normal)
        butt2label.layer.cornerRadius = 3
        butt2label.layer.shadowColor = UIColor.grayColor().CGColor
        butt2label.layer.shadowOpacity = 0.7
        butt2label.layer.shadowRadius = 3
        butt2label.layer.shadowOffset = CGSizeMake(3.0, 3.0)


        butt3label.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        butt3label.titleLabel?.textAlignment = NSTextAlignment.Center
        butt3label.setTitle("Een koud kompres met verse kruiden\nmoet helpen!", forState: UIControlState.Normal)
        butt3label.layer.cornerRadius = 3
        butt3label.layer.shadowColor = UIColor.grayColor().CGColor
        butt3label.layer.shadowOpacity = 0.7
        butt3label.layer.shadowRadius = 3
        butt3label.layer.shadowOffset = CGSizeMake(3.0, 3.0)

        
        butt4label.titleLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        butt4label.titleLabel?.textAlignment = NSTextAlignment.Center
        butt4label.setTitle("Er is maar één oplossing;\ngeef Barendt verse groenten en fruit!", forState: UIControlState.Normal)
        butt4label.layer.cornerRadius = 3
        butt4label.layer.shadowColor = UIColor.grayColor().CGColor
        butt4label.layer.shadowOpacity = 0.7
        butt4label.layer.shadowRadius = 3
        butt4label.layer.shadowOffset = CGSizeMake(3.0, 3.0)

        
        volgende.enabled = false
        

    }
    
    override func viewDidAppear(animated: Bool) {
        whatsappImage.image = UIImage(named: "barendtziek.png")
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
            initialSpringVelocity: 4.0, options: [], animations:
            {
                self.whatsappImage.center = CGPointMake(self.whatsappImage.center.x - 400, self.whatsappImage.center.y)
                
                MyPlayer.playIt("Barendt", ext: "mp3")
                
            }, completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
