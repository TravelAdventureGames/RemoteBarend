//
//  routeAanwijzing.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 04-12-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import Foundation
import UIKit

class routeAanwijzing: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setLabelStyle()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func awakeFromNib() {
        setLabelStyle()
    }
    
    func setLabelStyle() {
        
        self.font = UIFont(name: "Futura", size: 13)
        self.textAlignment = .Left
        self.layer.masksToBounds = true
        self.numberOfLines = 0
        self.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.sizeToFit()
    }
    
}