//
//  hangmanViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 11-09-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import Foundation

class hangmanViewController: UIViewController, UITextFieldDelegate {
    
    var resultLabelText = [" Het woord dat ik zoek heeft te maken met foltering en pijn, heel veel pijn!", " OK, nog één hint dan... Een ander woord voor folteren is 'martelen'", "Jullie hebben het woord niet geraden.... Jullie hangen! Het woord wat ik zocht was 'MARTELWERKTUIG'. Geen florijnen voor jullie dus! Snel vergeten maar, ga naar de volgende locatie!"]
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var galgImage: UIImageView!
    @IBOutlet var secretWord: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var checkButtonLabel: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    var secretWordArray = ["-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-"]
    var wordArray = ["m", "a", "r", "t", "e", "l", "w", "e", "r", "k", "t", "u", "i", "g"]
    var chosenLetters = [String]()
    
    var counter = 0
    var goedcounter = 0
    
    var buttonCounter = Int()
    
    let backgroundImage = UIImage(named: "galgenveld.jpg")
    var imageView: UIImageView!
    
    @IBAction func checkButton(sender: AnyObject) {

        textField.resignFirstResponder() // haalt keyboard weg na button press
        
        buttonCounter = buttonCounter + 1
            
        
        let input = textField.text
        var i = Int()
        var allreadycontains: Bool
        
        if chosenLetters.contains(input!)  {
            
        allreadycontains = true
            

            
        } else {
        
        chosenLetters.append(input!)
            print(chosenLetters)
            
        allreadycontains = false
            
        }

        if wordArray.contains(input!) && allreadycontains == false {
            MyPlayer.playIt("win", ext: "wav")
            
            goedcounter = goedcounter + 1

            if goedcounter == 11 { // speler heeft gewonnen
                score = score + 20 - (counter * 2)
                scoreLabel.text = " Score \(score)"
                
                if counter == 0 {
                    
                let alert1 = UIAlertController(title: "Yes!!", message: "Jullie hebben gewonnen! Jullie hadden alles goed en verdienen dus 20 florijnen! Op naar de volgende locatie!", preferredStyle: UIAlertControllerStyle.Alert)
                    alert1.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                        
                        self.performSegueWithIdentifier("naarIJ", sender: nil)
                        
                        
                    }))
                    
                    self.presentViewController(alert1, animated: true, completion: nil)
                    
                    
                } else {
                
                let alert1 = UIAlertController(title: "Yes!!", message: "Jullie hebben gewonnen! Jullie hadden \(counter) foute antwoorden dus er gaan \(counter * 2) florijnen van je totaal af. Alles opgeteld en afgetrokken verdien je dus \(20 - (counter * 2)) florijnen! Op naar de volgende locatie!", preferredStyle: UIAlertControllerStyle.Alert)
                alert1.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in

                    self.performSegueWithIdentifier("naarIJ", sender: nil)
                   
                    
                }))
                
                self.presentViewController(alert1, animated: true, completion: nil)
                
                }
                textField.text = ""
                checkButtonLabel.enabled = false
                textField.enabled = false
                //self.performSegueWithIdentifier("naarIJ", sender: nil)
                
                
            }
            
            for (i=0; i<14;i++) {
                if input == wordArray[i] {
                
                secretWordArray[i] = input!
                print(secretWordArray)


                }
            secretWord.text = "\(secretWordArray[0])\(secretWordArray[1])\(secretWordArray[2])\(secretWordArray[3])\(secretWordArray[4])\(secretWordArray[5])\(secretWordArray[6])\(secretWordArray[7])\(secretWordArray[8])\(secretWordArray[9])\(secretWordArray[10])\(secretWordArray[11])\(secretWordArray[12])\(secretWordArray[13])"
                

                textField.text = ""

            }
        
    
    
        } else {
            MyPlayer.playIt("error", ext: "wav")
            counter = counter + 1 // de counter telt het aantal foute letters. Bij 4 en 6 foute antwoorden krijgen de spelers een hint-alert.
            textField.text = ""
            
            if counter < 4 && allreadycontains == true {
                
                let alert1 = UIAlertController(title: "Let op", message: "Deze letter hadden jullie al gebruikt!", preferredStyle: UIAlertControllerStyle.Alert)
                alert1.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                    //self.dismissViewControllerAnimated(true, completion: nil)
                    
                }))
                

                self.presentViewController(alert1, animated: true, completion: nil)
                textField.text = ""
            }
            
            if counter == 4 {
                
                let alert1 = UIAlertController(title: "Hint", message: "\(resultLabelText[0])", preferredStyle: UIAlertControllerStyle.Alert)
                alert1.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                    //self.dismissViewControllerAnimated(true, completion: nil)
                    
                }))
                
                self.textField.delegate = self
                self.presentViewController(alert1, animated: true, completion: nil)
                textField.text = ""
                
            } else if counter == 5 {
                
                let alert1 = UIAlertController(title: "Laatste hint...", message: "\(resultLabelText[1])", preferredStyle: UIAlertControllerStyle.Alert)
                alert1.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                    //self.dismissViewControllerAnimated(true, completion: nil)
                    
                }))
                

                self.presentViewController(alert1, animated: true, completion: nil)
                textField.text = ""
                
            }
            
            if counter < 6 {
                
                galgImage.image = UIImage(named: "hang\(counter + 1).png")

            
            } else if counter == 6 { //speler hangt en heeft verloren
                
                galgImage.image = UIImage(named: "hang\(counter + 1).png")
                
                let alert1 = UIAlertController(title: "Oh nee!", message: "\(resultLabelText[2])", preferredStyle: UIAlertControllerStyle.Alert)
                
                alert1.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                    self.performSegueWithIdentifier("naarIJ", sender: nil)
              
                

                    
                }))
    

                self.presentViewController(alert1, animated: true, completion: nil)
                
                textField.text = ""
                checkButtonLabel.enabled = false
                textField.enabled = false

                
            }
        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        


        scoreLabel.text = " Score \(score)"
        scoreLabel.layer.cornerRadius = 3
        scoreLabel.layer.masksToBounds = true
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = backgroundImage
        imageView.center = view.center
        imageView.alpha = 0.2
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)


    }
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
