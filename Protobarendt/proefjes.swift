//
//  proefjes.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 20-01-16.
//  Copyright © 2016 Martijn van Gogh. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    func drawMess() {
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.2,
            initialSpringVelocity: 4.0, options: [], animations:
            {
                self.view.center = CGPointMake(self.view.center.x - 400, self.view.center.y)
    
                MyPlayer.playIt("Aaltje", ext: "mp3")
    
            }, completion: nil)
    }
}


