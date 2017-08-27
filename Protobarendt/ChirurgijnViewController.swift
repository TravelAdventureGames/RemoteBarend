//
//  ChirurgijnViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 23-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation

class ChirurgijnViewController: UIViewController {

    //var textArr = ["Bericht van Aaltje... \n\rIk heb jullie hulp nodig! Barendt krijgt heel slecht te eten van Griet en voelt zich ziek. Als je in de gouden eeuw ziek bent, word je geholpen door een chirurgijn, een soort 'dokter'."," Helaas weten wij in de 17e eeuw nog helemaal niet zoveel van ziektes en het menselijk lichaam als jullie. Jullie zouden een chirurgijn in jullie tijd vaak gewoon een kwakzalver noemen, maar voor ons is het vaak de enige hoop..!", "Willen jullie Barendt helpen met jullie 21ste eeuwse kennis? Maar let wel op! Ga niet teveel af op de bemoeienissen van Ambrosius Beurzensnijder. Hij noemt zichzelf chirurgijn, maar hij is eigenlijk een kapper die dat hele doktersgedoe er gewoon een beetje bij doet."]
    
    
    var counter = 1
    
    var audioPLayer = AVAudioPlayer()
    
    @IBOutlet var whatsappImage: UIImageView!

    @IBOutlet var imageSchreiers: UIImageView!
    
    @IBOutlet var volgendeButt: UIButton!
    
    @IBAction func swipeLeft(sender: AnyObject) {
        
        buttonPressed(self)
        
    }
    @IBAction func buttonPressed(sender: AnyObject) {
        
            counter++
        
            if counter < 4 {
                whatsappImage.image = UIImage(named: "aaltjeschrMess\(counter).png")
                UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
                    initialSpringVelocity: 4.0, options: [], animations:
                    {
                        self.whatsappImage.center = CGPointMake(self.whatsappImage.center.x - 400, self.whatsappImage.center.y)
                        
                        MyPlayer.playIt("Aaltje", ext: "mp3")
                        
                    }, completion: nil)
                
            } else if counter == 4 {
                self.performSegueWithIdentifier("naarChOpdracht", sender: nil)
                
            }
            
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageSchreiers.image = UIImage(named: "Aaltje.png")
        //labelText.text = textArr[counter - 1]
        
    }

    override func viewDidAppear(animated: Bool) {
        whatsappImage.image = UIImage(named: "aaltjeschrMess1.png")
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
            initialSpringVelocity: 4.0, options: [], animations:
            {
                self.whatsappImage.center = CGPointMake(self.whatsappImage.center.x - 400, self.whatsappImage.center.y)
                
                MyPlayer.playIt("Aaltje", ext: "mp3")
                
            }, completion: nil)
        

    }
    

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    


}
