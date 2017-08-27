//
//  grietMessView.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 16-11-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import AVFoundation


class grietMessView: UIView {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var view: UIView!
    @IBOutlet var grietMessLabel: messLabel!
    @IBOutlet var grietMessLabel2: messLabel!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NSBundle.mainBundle().loadNibNamed("grietMessView", owner: self, options: nil)
        self.addSubview(self.view)
    
        
    }

}
