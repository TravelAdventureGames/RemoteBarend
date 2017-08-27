//
//  barendtMessView.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 25-11-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit

class barendtMessView: UIView {
    @IBOutlet var view: UIView!


    @IBOutlet var grietMessLabel: messLabel!
    @IBOutlet var grietMessLabel2: messLabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NSBundle.mainBundle().loadNibNamed("grietMessView", owner: self, options: nil)
        self.addSubview(self.view)
        
        
    }

}
