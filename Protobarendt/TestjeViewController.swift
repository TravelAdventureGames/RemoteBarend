//
//  TestjeViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 22-09-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation

class TestjeViewController: UIViewController {


    //var textArr = ["Vorige week nog stond ik hier ook voor ‘t Aepjen, net zoals jullie nu... Was ik maar nooit naar binnen gegaan!", "Mijn schatje Aaltje, zei nog tegen me: 'Kom na je werk meteen naar huis Barendt!' Maar nee, ik moest weer zonodig een biertje drinken in het Aepjen! En ineens zit ik me daar tegen twaalven me een rekening van tien florijnen!", "Een groot stoer wijf genaamd Griet, komt op dat moment naar me toe en zegt dat ze me wel wil helpen door mijn schuld te betalen. Ik hoef alleen maar op een of ander vaag papiertje een handtekening te zetten. Nou dat doe ik natuurlijk!... En dan blijkt dat ik mijn krabbel heb gezet onder een ‘ziel’; dat is een contract met de VOC!", "In september moet ik mee met het VOC-schip de Gouden Buis! Die feeks van een Griet is een 'zielverkoopster' die de kroegen afstruint op zoek naar sukkeltjes zoals ik. Tjonge, wat ben ik dom geweest! Toen ik het Aepjen uitliep werd ik meteen door twee krachtpatsers van broers van Griet vastgegrepen. Sindsdien word ik gevangen gehouden in haar kelder.", "Hé, jullie gaan toch niet afhaken nu? Op de Dam waren jullie al heel goed bezig! Ik leg mijn lot in handen van jullie team! Schrijf je team nu officieel in en voer de opdrachten uit. Verdien daar zoveel florijnen mee dat je me vrij kunt kopen bij Griet! Maar pas goed op voor haar, want het is een vals secreet!"]
   
    var counter = 1
    var audioPLayer = AVAudioPlayer()
    
    
    @IBOutlet var whatsappImage: UIImageView!
    
    @IBOutlet var imageSchreiers: UIImageView!
    
    @IBOutlet var volgendeButt: UIButton!
    
    @IBAction func swipLeft(sender: AnyObject) {
        buttonPressed(self)
  
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        
        
        if counter < 5 {
            counter++
            //maakt een crossfade (crossdisolve) op basis van div images in 1 imageview!
            
            trans()
                
                
                } else if counter == 5 {
                self.performSegueWithIdentifier("toTeamnaam", sender: nil)
                
                
            
            
        }
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        imageSchreiers.image = UIImage(named: "api1.png")
        //labelText.text = textArr[counter - 1]
        
    }
    
    override func viewDidAppear(animated: Bool) {
        whatsappImage.image = UIImage(named: "aepjenMess1.png")
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
            initialSpringVelocity: 4.0, options: [], animations:
            {
                self.whatsappImage.center = CGPointMake(self.whatsappImage.center.x - 400, self.whatsappImage.center.y)
                
                let bgMusicURL:NSURL = NSBundle.mainBundle().URLForResource("Barendt", withExtension: "mp3")!
                
                do { bgMusic = try AVAudioPlayer(contentsOfURL: bgMusicURL, fileTypeHint: nil)
                    
                } catch _ {
                    
                    return //if it doesn't exist, don't play it
                }
                bgMusic.numberOfLoops = 0
                bgMusic.prepareToPlay()
                bgMusic.play()
                
            }, completion: nil)
    }
    
    func trans() {
        let toImage = UIImage(named:"api\(counter).png")
        
        
        //imageSchreiers.image = UIImage(named: "api\(counter).png")
        whatsappImage.image = UIImage(named: "aepjenMess\(counter).png")
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
            initialSpringVelocity: 4.0, options: [], animations:
            {
                self.whatsappImage.center = CGPointMake(self.whatsappImage.center.x - 400, self.whatsappImage.center.y)
                
                let bgMusicURL:NSURL = NSBundle.mainBundle().URLForResource("Barendt", withExtension: "mp3")!
                
                do { bgMusic = try AVAudioPlayer(contentsOfURL: bgMusicURL, fileTypeHint: nil)
                    
                } catch _ {
                    
                    return //if it doesn't exist, don't play it
                }
                bgMusic.numberOfLoops = 0
                bgMusic.prepareToPlay()
                bgMusic.play()
                
                
                
            }, completion: nil)
        
        
        
        UIView.transitionWithView(self.imageSchreiers,
            duration:1.0,
            options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: { self.imageSchreiers.image = toImage },
            completion: nil)
        //labelText.text = textArr[counter - 1]
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
