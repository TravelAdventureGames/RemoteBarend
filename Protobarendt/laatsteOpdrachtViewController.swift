//
//  laatsteOpdrachtViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 18-11-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit

class laatsteOpdrachtViewController: UIViewController {


    @IBOutlet var inputLabel: UITextField!
    @IBOutlet var inputLabel2: UITextField!
    
    @IBOutlet var scoreLabel: ScoreLabeltje!
    @IBOutlet var label: UILabel!
    @IBAction func checkButton(sender: AnyObject) {
        
        if inputLabel.text == "10" && (inputLabel2.text == "10" || inputLabel2.text == "1") {
            
            MyPlayer.playIt("win", ext: "wav")
            performSegueWithIdentifier("toWin", sender: self)
            
        } else {
            MyPlayer.playIt("error", ext: "wav")
            performSegueWithIdentifier("toLose", sender: self)
        }
    }
    
    let backgroundImage = UIImage(named: "kleinstehuis.jpg")
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputLabel.keyboardType = .NumberPad
        inputLabel2.keyboardType = .NumberPad
        
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .ScaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = backgroundImage
        imageView.center = view.center
        imageView.alpha = 0.2
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)

        
        score = lastScore
        scoreLabel.text = "Score \(score)"
        
      label.text = "De allerlaatste opdracht. Word niet zenuwachtig, maar bij een fout antwoord moeten Barendt en jullie meevaren op de Gouden Buis richting Indonesië.\r\rZoek het kleinste huisje van Amsterdam. Het staat hier vlakbij in deze straat. Simpele vraag: Hoe groot in m² is de begane grond van dit huisje? Let op: geef het antwoord in 2 cijfers achter de komma!"

    
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
