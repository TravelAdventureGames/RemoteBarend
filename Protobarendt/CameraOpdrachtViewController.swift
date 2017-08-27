//
//  CameraOpdrachtViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 24-09-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit


class CameraOpdrachtViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var imagePicker: UIImagePickerController!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var buttonLabel: UIButton!

    @IBAction func takePhoto(sender: AnyObject) {
    
        
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .Camera
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        
        if(imagePicker.sourceType == UIImagePickerControllerSourceType.Camera) {
            // Access the uncropped image from info dictionary
            
            let imageToSave1: UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage //same but with different way
            
            imageView.image = imageToSave1

            
            UIImageWriteToSavedPhotosAlbum(imageToSave1, nil, nil, nil)
            //self.dismissViewControllerAnimated(true, completion: nil)
            //self.performSegueWithIdentifier("toPunten", sender: nil)


            
        }
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            self.performSegueWithIdentifier("toPunten", sender: nil)
        }
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage


        
    }
    
    //(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonLabel.layer.cornerRadius = 5
        

        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toPunten" {
            
            segue.destinationViewController as! PuntenAepjenViewController
            let dvc = segue.destinationViewController as! PuntenAepjenViewController
            dvc.FotoGegeven = imageView.image!
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

