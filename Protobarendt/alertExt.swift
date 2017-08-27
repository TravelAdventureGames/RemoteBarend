//
//  AlertHelper.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 19-01-16.
//  Copyright © 2016 Martijn van Gogh. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

extension UIViewController {
    
    func alertExt(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(OKAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}
