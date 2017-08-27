//
//  aaltjeMessView.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 24-11-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit

class aaltjeMessView: UIView {

    @IBOutlet var view: UIView!

    @IBOutlet var grietMessLabel: messLabel!

    @IBOutlet var grietMessLabel2: messLabel!
    @IBOutlet var imageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NSBundle.mainBundle().loadNibNamed("aaltjeMessView", owner: self, options: nil)
        self.addSubview(self.view)
        
        
    }

}
