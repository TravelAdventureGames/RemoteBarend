//
//  EindschermViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 04-01-16.
//  Copyright © 2016 Martijn van Gogh. All rights reserved.
//

import UIKit

class EindschermViewController: UIViewController {

    @IBOutlet var eindText: textGroter!
    override func viewDidLoad() {
        super.viewDidLoad()

    eindText.text = "Best team \(teamNaamGegeven),\n\nNamens Adventuregames willen we jullie bedanken voor het spelen van dit spel. We hopen dat jullie er plezier aan hebben beleefd!\n\nMisschien hebben jullie de smaak wel te pakken gekregen, en willen jullie meer.. Goed nieuws, want er liggen ook andere games op jullie te wachten. Ga terug naar het beginscherm voor een overzicht van het aanbod.\n\nHartelijke groet,\n\nMartijn van Gogh\nErik Everink"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
