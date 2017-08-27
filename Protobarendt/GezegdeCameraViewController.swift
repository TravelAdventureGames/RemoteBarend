//
//  GezegdeCameraViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 12-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation



class GezegdeCameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var whatsappImage: UIImageView!
    var imagePicker: UIImagePickerController!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var takeLabel: UIButton!

    @IBOutlet var vraagLabel: UILabel!
    
    var vraagArray = ["Hij is een een zuipschuit", "Een schot voor de boeg geven.", "Hij valt buiten de boot."]
    
    @IBAction func takePhoto(sender: AnyObject) {
        
        
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .Camera
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        
        if(imagePicker.sourceType == UIImagePickerControllerSourceType.Camera) {
            // Access the uncropped image from info dictionary
            
            let imageToSave2: UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage //same but with different way
            
            imageView.image = imageToSave2
            
            
            UIImageWriteToSavedPhotosAlbum(imageToSave2, nil, nil, nil)
            //self.dismissViewControllerAnimated(true, completion: nil)
            //self.performSegueWithIdentifier("toPunten", sender: nil)
            

            
            
            
        }
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            self.performSegueWithIdentifier("toGezegdefoto", sender: nil)
        }
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        
        
    }
    
    //(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let randomIndex = Int(arc4random_uniform(UInt32(vraagArray.count)))
        vraagLabel.text = vraagArray[randomIndex]
        gekozenGezegde = vraagLabel.text!
        
        takeLabel.layer.cornerRadius = 3
        takeLabel.layer.shadowColor = UIColor.grayColor().CGColor
        takeLabel.layer.shadowOpacity = 0.8
        takeLabel.layer.shadowOffset = CGSizeMake(1.0, 1.0)
        
        

        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toGezegdefoto" {
            
            segue.destinationViewController as! gezegdeFotoViewController
            let dvs = segue.destinationViewController as! gezegdeFotoViewController
            dvs.FotoGegeven1 = imageView.image!
            
            
        }
    }
    
    func whatsMessage() {
        
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
            initialSpringVelocity: 4.0, options: [], animations:
            {
                self.whatsappImage.center = CGPointMake(self.whatsappImage.center.x - 400, self.whatsappImage.center.y)
                
                let bgMusicURL:NSURL = NSBundle.mainBundle().URLForResource("Griet", withExtension: "mp3")!
                
                do { bgMusic = try AVAudioPlayer(contentsOfURL: bgMusicURL, fileTypeHint: nil)
                    
                } catch _ {
                    
                    return //if it doesn't exist, don't play it
                }
                bgMusic.numberOfLoops = 0
                bgMusic.prepareToPlay()
                bgMusic.play()
                
            }, completion: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        whatsappImage.image = UIImage(named: "amsterdam1.png")
        
        whatsMessage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
