//
//  ScoreLabeltje.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 10-11-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit

class ScoreLabeltje: UILabel {

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
        
        self.layer.cornerRadius = 5
        self.layer.backgroundColor = UIColor.whiteColor().CGColor
        self.layer.borderColor = UIColor.grayColor().CGColor
        self.layer.borderWidth = 0.3
        self.font = UIFont(name: "Helveticaneue-Bold", size: 12)
        self.textAlignment = .Center
        self.layer.masksToBounds = true
        
    }

}
