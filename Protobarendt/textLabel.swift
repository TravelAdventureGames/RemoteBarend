//
//  textLabel.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 11-11-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit

class textLabel: UILabel {

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
        
        self.font = UIFont(name: "Baskerville-bold", size: 13)
        self.textAlignment = .Left
        self.layer.masksToBounds = true
        self.numberOfLines = 0
        self.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.sizeToFit()
    }

}
