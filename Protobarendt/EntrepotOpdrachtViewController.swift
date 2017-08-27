//
//  EntrepotOpdrachtViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 09-09-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit

class EntrepotOpdrachtViewController: UIViewController {

    var gameDeactivated = false
    var timer = NSTimer()
    var minutes:Int = 10
    var seconds:Int = 1
    var stopWatchString: String = ""
    var backgroundTask: UIBackgroundTaskIdentifier = UIBackgroundTaskInvalid
    var inForeground = true
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    @IBOutlet var volgende: UIBarButtonItem!

    @IBOutlet var buttlabel: UIButton!

    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var antwoordLabel: UILabel!
    
    @IBOutlet var checkButtonLabel: UIButton!
    
    @IBOutlet var antwImage: UIImageView!
    
    @IBOutlet var stopWatchLabel: UILabel!
    
    @IBOutlet var clue1Label: UILabel!
    
    @IBOutlet var clue2Label: UILabel!
    
    @IBOutlet var clue3Label: UILabel!
    
    @IBOutlet var antwoordInput: UITextField!
    
    @IBAction func swipeLeft(sender: AnyObject) {
        if gameDeactivated == true {
            self.performSegueWithIdentifier("toNext", sender: self)
        }
    }
    @IBAction func checkButton(sender: AnyObject) {
        gameDeactivated = true
        buttlabel.hidden = true
        timer.invalidate()
        checkButtonLabel.enabled = false
        antwoordInput.enabled = false

        
        clue1Label.text = "Zoek het nummer van het pand dat mij een ‘behaaglijk gevoel in mijn woningen’ geeft.. (-> antwoord: Warmenhuizen, nr. 78)"
        clue2Label.text = "Tel hierbij op het nummer van het pand dat ‘klinkt als de bedekking van een vogel’. (-> antwoord: Veere, nr. 72)"
        clue3Label.text = "Tel hier tenslotte bij op het jaartal van de gevelsteen van ‘Pakhuys Den Zeeridder’. (-> antwoord: 1710)"

        if antwoordInput.text == "" {
            
            antwoordLabel.text = "Waarom hebben jullie nou niks ingevuld? Hiermee verdien je natuurlijk geen punten!"
            
            volgende.enabled = true

            
        } else if antwoordInput.text == "1860" {
            MyPlayer.playIt("win", ext: "wav")
            volgende.enabled = true
            antwoordLabel.text = "Dat was goed.. Slim gedaan! 20 florijnen zijn voor jullie.."
            scoreLabel.text = " Score \(score + 20)"
            score = score + 20
            antwoordInput.hidden = true
            antwImage.image = UIImage(named: "emoticonGoed.png")
            
       
        } else {
            MyPlayer.playIt("error", ext: "wav")
            antwoordLabel.text = "Oei, het antwoord was fout.. Het antwoord moest zijn 1860. Geen punten dus... Hieronder staat het antwoord uitgelegd."
            volgende.enabled = true
            antwoordInput.hidden = true
            antwImage.image = UIImage(named: "emoticonFout.png")
        }

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("reinstateBackgroundTask"), name: UIApplicationDidBecomeActiveNotification, object: nil)
    
    antwoordInput.keyboardType = .NumberPad
    volgende.enabled = false
    scoreLabel.text = " Score \(score)"


        
    antwoordLabel.text = "Ga snel van start want jullie hebben maar 10 minuten! Zoals jullie zien hebben de pakhuizen namen van havensteden die op alfabetische volgorde aan de panden zijn gegeven. Hier volgt de cryptische rekensom. Je zoekt dus naar een getal! Als je deze opdracht volbrengt verdien je 20 florijnen!"
        
    clue1Label.text = "Zoek het nummer van het pand dat mij een ‘behaaglijk gevoel in mijn woningen’ geeft.."
    clue1Label.layer.cornerRadius = 5
    clue1Label.layer.masksToBounds = true
    
    
    clue2Label.text = "Tel hierbij op het nummer van het pand dat ‘klinkt als de bedekking van een vogel’"
    clue2Label.layer.cornerRadius = 5
    clue2Label.layer.masksToBounds = true
        
    clue3Label.text = "Tel hier tenslotte bij op het jaartal van de gevelsteen van ‘Pakhuys Den Zeeridder’."
    clue3Label.layer.cornerRadius = 5
    clue3Label.layer.masksToBounds = true

    if inForeground {
            
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("updateStopwatch"), userInfo: nil, repeats: true)
            registerBackgroundTask()
            
        } else {
            
            if backgroundTask != UIBackgroundTaskInvalid {
                endBackgroundTask()
            }
        }
    
        

    }

    func updateStopwatch() {
        
        if minutes == 0 && seconds == 1 {
            
            timer.invalidate()
            checkButtonLabel.enabled = false
            seconds = 0
            gameDeactivated = true
        } else {
        
            seconds -= 1

        
                if seconds == 0 {
            
                    minutes -= 1
                    seconds = 59
                
        }
            
        }
        
        let secondString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minuteString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
        stopWatchLabel.text = "\(minuteString).\(secondString)"
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // laat keyboard verdwijnen als je erbuiten tapped
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func reinstateBackgroundTask() {
        if backgroundTask == UIBackgroundTaskInvalid {
            registerBackgroundTask()
        }
    }
    // 2 funcs die ervoor zorgen dat de timer wanneer in backgroundmodus nog 3 minuten of langer blijft doorlopen..
    func registerBackgroundTask() {
        backgroundTask = UIApplication.sharedApplication().beginBackgroundTaskWithExpirationHandler {
            [unowned self] in
            self.endBackgroundTask()
        }
        assert(backgroundTask != UIBackgroundTaskInvalid)
    }
    
    func endBackgroundTask() {
        NSLog("Background task ended.")
        UIApplication.sharedApplication().endBackgroundTask(backgroundTask)
        backgroundTask = UIBackgroundTaskInvalid
    }
}
