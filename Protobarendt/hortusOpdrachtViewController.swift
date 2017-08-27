//
//  hortusOpdrachtViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 12-11-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit

@IBDesignable
class hortusOpdrachtViewController: UIViewController {

    

    @IBOutlet var volgende: UIBarButtonItem!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var vraagLabel: UILabel!
    @IBOutlet var bu1: UIButton!
    @IBOutlet var bu2: UIButton!
    @IBOutlet var bu3: UIButton!
    @IBOutlet var bu4: UIButton!
    
    var ansGiven = false
    let image4 = UIImage(named: "nederland.jpg")
    let image1 = UIImage(named: "italy.gif")
    let image2 = UIImage(named: "ethiopia.jpg")
    let image3 = UIImage(named: "iran.jpg")
    
    
    @IBAction func swipeLeft(sender: AnyObject) {
        if ansGiven == true {
            
            self.performSegueWithIdentifier("toNext", sender: self)
        }
    }
    @IBAction func button1(sender: AnyObject) {
        ansGiven = true
        MyPlayer.playIt("error", ext: "wav")
        vraagLabel.text = "Fout! In Italië houden ze wel erg van koffie, maar koffiedrinken is in Ethiopië uitgevonden. Een herder zag dat zijn geiten nogal opgewekt werden van het eten van koffiebonen. Hij kookte daarop de bonen en dronk van het drabje dat was ontstaan. Via rondtrekkende Arabieren heeft koffie daarna de wereld veroverd!"
        score = score + 5
        scoreLabel.text = " Score \(score)"
        volgende.enabled = true
        butEnabled(false)
    }
    @IBAction func button2(sender: AnyObject) {
        ansGiven = true
        MyPlayer.playIt("win", ext: "wav")
        vraagLabel.text = "Goed! Volgens de legende zag een herder uit de provincie Kaffa dat zijn geiten nogal opgewekt werden van het eten van koffiebonen. Hij kookte daarop de bonen en dronk van het drabje dat was ontstaan. Via rondtrekkende Arabieren heeft koffie daarna de wereld veroverd!"
        score = score + 10
        scoreLabel.text = " Score \(score)"
        volgende.enabled = true
        butEnabled(false)
    }
    
    @IBAction func button3(sender: AnyObject) {
        ansGiven = true
        MyPlayer.playIt("error", ext: "wav")
        vraagLabel.text = "Fout! In Nederland zijn we inderdaad koffieleuten, maar het koffiedrinken is in Ethiopië uitgevonden. Een herder uit de provincie Kaffa zag dat zijn geiten nogal opgewekt werden van het eten van koffiebonen. Hij kookte daarop de bonen en dronk van het drabje dat was ontstaan. Via rondtrekkende Arabieren heeft koffie daarna de wereld veroverd!"
        volgende.enabled = true
        butEnabled(false)
    }
    @IBAction func button4(sender: AnyObject) {
        ansGiven = true
        MyPlayer.playIt("error", ext: "wav")
        vraagLabel.text = "Fout! In Iran zijn ze inderdaad koffieleuten, maar koffiedrinken is in Ethiopië uitgevonden. Een herder zag dat zijn geiten nogal opgewekt werden van het eten van koffiebonen. Hij kookte daarop de bonen en dronk van het drabje dat was ontstaan. Via rondtrekkende Arabieren heeft koffie daarna de wereld veroverd!"
        volgende.enabled = true
        butEnabled(false)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        volgende.enabled = false
        scoreLabel.text = " Score \(score)"
        vraagLabel.text = "Voor 10 florijnen!\n\nWat denken jullie? In welk land werd het drinken van koffie ontdekt?"
        

        butLayout(bu1, image: image1!)
        butLayout(bu2, image: image2!)
        butLayout(bu3, image: image4!)
        butLayout(bu4, image: image3!)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func butLayout(name: UIButton, image: UIImage) {
        name.setBackgroundImage(image, forState: .Normal)
        name.layer.cornerRadius = 9
        name.layer.borderWidth = 1
        name.layer.borderColor = UIColor.lightGrayColor().CGColor
        name.layer.shadowColor = UIColor.lightGrayColor().CGColor;
        name.layer.shadowOpacity = 0.7
        name.layer.shadowRadius = 5
        name.layer.shadowOffset = CGSize(width: 1, height: 1)
        name.layer.masksToBounds = true
        
    }
    func butEnabled(enabled: Bool) {
        bu1.enabled = enabled
        bu2.enabled = enabled
        bu3.enabled = enabled
        bu4.enabled = enabled
    }

}
