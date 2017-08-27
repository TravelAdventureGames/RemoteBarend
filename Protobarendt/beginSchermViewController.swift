//
//  beginSchermViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 16-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class beginSchermViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {
    
    @IBOutlet var gameOmschrijving: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var map: MKMapView!
    var LM = CLLocationManager()

 
    
    @IBAction func swipeLeft(sender: AnyObject) {
        performSegueWithIdentifier("toNext", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameOmschrijving.text = "In deze game nemen we je mee naar het Amsterdam uit de Gouden Eeuw, de hoogtijdagen van de Verenigde Oostindische Compagnie. De VOC had een enorme vloot schepen die vooral in Azië handel dreven. Ook onze hoofdpersoon Barendt Goedbloed zal binnenkort naar Indonesië afvaren. Een levensgevaarlijke reis, maar met jullie hulp kan Barendt misschien nog gered worden! Speel het spel en zie de mooiste plekjes van deze stad uit lang vervlogen tijden!"

        LM = CLLocationManager()
        LM.delegate = self
        LM.requestAlwaysAuthorization()
        self.LM.desiredAccuracy = kCLLocationAccuracyBest
        
        self.map.delegate = self // zorgt voor het weergeven van pins als customicons
        let info1 = CustomPointAnnotation()
        info1.coordinate = CLLocationCoordinate2DMake(52.373074, 4.892922)
        info1.title = "De Dam"
        info1.subtitle = "Amsterdam"
        info1.imageName = "location1.png"
        map.addAnnotation(info1)
        
        self.map.delegate = self // zorgt voor het weergeven van pins als customicons
        let info2 = CustomPointAnnotation()
        info2.coordinate = CLLocationCoordinate2DMake(52.376490, 4.900181)
        info2.title = "'T Aepjen"
        info2.subtitle = "Amsterdam"
        info2.imageName = "location2.png"
        map.addAnnotation(info2)
        
        self.map.delegate = self // zorgt voor het weergeven van pins als customicons
        let info3 = CustomPointAnnotation()
        info3.coordinate = CLLocationCoordinate2DMake(52.376411, 4.902317)
        info3.title = "Schreierstoren"
        info3.subtitle = "Amsterdam"
        info3.imageName = "location3.png"
        map.addAnnotation(info3)
        
        self.map.delegate = self // zorgt voor het weergeven van pins als customicons
        let info4 = CustomPointAnnotation()
        info4.coordinate = CLLocationCoordinate2DMake(52.378313, 4.905368)
        info4.title = "Uitzich op het Galgenveld Noord"
        info4.subtitle = "Amsterdam"
        info4.imageName = "location4.png"
        map.addAnnotation(info4)
        
        self.map.delegate = self // zorgt voor het weergeven van pins als customicons
        let info5 = CustomPointAnnotation()
        info5.coordinate = CLLocationCoordinate2DMake(52.377883, 4.909979)
        info5.title = "De scheepskameel aan het IJ"
        info5.subtitle = "Amsterdam"
        info5.imageName = "location5.png"
        map.addAnnotation(info5)
        
        self.map.delegate = self // zorgt voor het weergeven van pins als customicons
        let info6 = CustomPointAnnotation()
        info6.coordinate = CLLocationCoordinate2DMake(52.372150, 4.912202)
        info6.title = "Glazen slaan op het Oosterdok"
        info6.subtitle = "Amsterdam"
        info6.imageName = "location6.png"
        map.addAnnotation(info6)
        
        self.map.delegate = self // zorgt voor het weergeven van pins als customicons
        let info7 = CustomPointAnnotation()
        info7.coordinate = CLLocationCoordinate2DMake(52.371564, 4.914944)
        info7.title = "Scheepvaartmuseum"
        info7.subtitle = "Amsterdam"
        info7.imageName = "location7.png"
        map.addAnnotation(info7)
        
        self.map.delegate = self // zorgt voor het weergeven van pins als customicons
        let info8 = CustomPointAnnotation()
        info8.coordinate = CLLocationCoordinate2DMake(52.369727, 4.919321)
        info8.title = "Oosterkerk"
        info8.subtitle = "Amsterdam"
        info8.imageName = "location8.png"
        map.addAnnotation(info8)

        self.map.delegate = self // zorgt voor het weergeven van pins als customicons
        let info9 = CustomPointAnnotation()
        info9.coordinate = CLLocationCoordinate2DMake(52.367454, 4.917934)
        info9.title = "Entrepotdok"
        info9.subtitle = "Amsterdam"
        info9.imageName = "location9.png"
        map.addAnnotation(info9)
        
        self.map.delegate = self // zorgt voor het weergeven van pins als customicons
        let info10 = CustomPointAnnotation()
        info10.coordinate = CLLocationCoordinate2DMake(52.366984, 4.906961)
        info10.title = "Hortus Botanicus"
        info10.subtitle = "Amsterdam"
        info10.imageName = "location10.png"
        map.addAnnotation(info10)
        
        self.map.delegate = self // zorgt voor het weergeven van pins als customicons
        let info11 = CustomPointAnnotation()
        info11.coordinate = CLLocationCoordinate2DMake(52.369825, 4.901623)
        info11.title = "Café De Sluyswacht"
        info11.subtitle = "Amsterdam"
        info11.imageName = "location11.png"
        map.addAnnotation(info11)
        
        self.map.delegate = self // zorgt voor het weergeven van pins als customicons
        let info12 = CustomPointAnnotation()
        info12.coordinate = CLLocationCoordinate2DMake(52.368222, 4.897718)
        info12.title = "Liefdesbrug"
        info12.subtitle = "Amsterdam"
        info12.imageName = "location12.png"
        map.addAnnotation(info12)
        
        self.map.delegate = self // zorgt voor het weergeven van pins als customicons
        let info13 = CustomPointAnnotation()
        info13.coordinate = CLLocationCoordinate2DMake(52.371165, 4.898133)
        info13.title = "Oost-Indisch Huis"
        info13.subtitle = "Amsterdam"
        info13.imageName = "location13.png"
        map.addAnnotation(info13)
        
        //Route tussen 2 punten vaststellen

        
        let directionsRequest = MKDirectionsRequest()
        let Damrak = MKPlacemark(coordinate: CLLocationCoordinate2DMake(info1.coordinate.latitude, info1.coordinate.longitude), addressDictionary: nil)
        
        directionsRequest.source = MKMapItem.mapItemForCurrentLocation() //geeft rechtstreeks de coordinaten voor de huidige locatie
        directionsRequest.destination = MKMapItem(placemark: Damrak)
        directionsRequest.transportType = MKDirectionsTransportType.Walking
        let directions = MKDirections(request: directionsRequest)
        
        
        directions.calculateDirectionsWithCompletionHandler { [unowned self] response, error in
            guard let unwrappedResponse = response else { return }
            
            for route in unwrappedResponse.routes {
                self.map.addOverlay(route.polyline)
                self.map.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                
                let distance = (route.distance/1000)
                print(distance)
                let y = Double(round(10*distance)/10)
                
                self.distanceLabel.text = "\(y) km"
                
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        print("didChangeAuthorizationStatus")
        
        switch status {
        case .NotDetermined:
            print(".NotDetermined")
            break
            
        case .Authorized:
            print(".Authorized")
            self.LM.startUpdatingLocation()
            break
            
        case .Denied:
            print(".Denied")
            break
            
        default:
            print("Unhandled authorization status")
            break
            
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location:CLLocation = locations.last as CLLocation!
        print("didUpdateLocations:  \(location.coordinate.latitude), \(location.coordinate.longitude)")
        //map.centerCoordinate = location.coordinate
        
        let center = CLLocationCoordinate2D(latitude: 52.371165, longitude: 4.898133)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        self.map.setRegion(region, animated: true)
        
        map.showsUserLocation = true
        //self.LM.stopUpdatingLocation()
        self.map.userInteractionEnabled = true
        self.map.zoomEnabled = true
        self.map.scrollEnabled = true

    }
    

    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        print("delegate called")
        
        if !(annotation is CustomPointAnnotation) {
            return nil
        }
        
        let reuseId = "test"
        
        var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            anView!.canShowCallout = true
        }
        else {
            anView!.annotation = annotation
        }
        
        //Set annotation-specific properties **AFTER**
        //the view is dequeued or created...
        
        let cpa = annotation as! CustomPointAnnotation
        anView!.image = UIImage(named:cpa.imageName)
        
        return anView
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        LM.stopUpdatingLocation()
    }
  

}
