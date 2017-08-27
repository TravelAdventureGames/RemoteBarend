//
//  beginViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 11-11-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation

class beginViewController: UIViewController {
    
    var textArr = ["Welkom op de Dam, hart van Nederlands Gouden Eeuw!\r\r\nAl die pracht en praal hier wordt mede mogelijk gemaakt door de Verenigde Oost-Indische Compagnie (VOC), die handelt in dure specerijen uit Azië. Maar de rijkdom is ongelijk verdeeld. Arme sloebers zijn voor een hongerloontje soms jarenlang op zee, in dienst van de VOC. Ruim de helft overleeft het niet....", "We nemen je in dit spel mee naar 1 juli 1622. In Amsterdam wordt druk gezocht naar bemanningen voor de VOC-vloot die in september gaat vertrekken.\n\nZielverkopers, een soort mensenhandelaars, verdienen veel geld met het doorverkopen van scheepsvolk aan de VOC. Heel wat jonge mannen zetten nietsvermoedend hun handtekening onder een VOC-contract, de zogenaamde ‘ziel’, en verkopen zo hun eigen ziel!", "Zo ook onze held Barendt Goedbloed. In de val gelokt door zielverkoopster Griet zet hij zijn handtekening onder een VOC-contract, dat hem twee jaar op zee zal houden. Maar Barendt wil helemaal niet! Totdat zijn schip vertrekt, wordt Barendt gevangen gehouden door Griet en haar twee broers.\n\nRed Barendt uit de greep van Griet door de opdrachten in dit spel te volbrengen. Begin snel en loop naar het startpunt: Het paleis op de Dam! Veel succes!"]
    
    
    var counter = 1
    
    
    @IBOutlet var volgende: UIButton!
    @IBOutlet var labelText: UILabel!
    @IBOutlet var imageSchreiers: UIImageView!

    @IBAction func swipeLeft(sender: AnyObject) {
        counter++
        if counter < 4 {
            trans()
            
        } else if counter == 4 {
            self.performSegueWithIdentifier("toDam", sender: nil)
        }
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        counter++
        
        if counter < 4 {
        
        //maakt een crossfade (crossdisolve) op basis van div images in 1 imageview!
        trans()
        
        
        } else if counter == 4 {
        
        self.performSegueWithIdentifier("toDam", sender: nil)
        
        
        
        }
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imageSchreiers.image = UIImage(named: "Dam1.png")
        labelText.text = textArr[counter - 1]
        labelText.sizeToFit()

    }
    func trans() {
        let toImage = UIImage(named:"Dam\(counter).png")
        
        UIView.transitionWithView(self.imageSchreiers,
            duration:1,
            options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: { self.imageSchreiers.image = toImage },
            completion: nil)
        labelText.text = textArr[counter - 1]
        labelText.sizeToFit()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
