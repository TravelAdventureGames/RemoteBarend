//
//  naarScheepvaartViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 13-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import AVFoundation

class naarScheepvaartViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var distanceLabel: UILabel!
    
    var LM = CLLocationManager()
    
    @IBOutlet var map: MKMapView!
    
    
    //hier bepaal ik de regio die ik wil monitoren voor entry
    let info7Region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 52.371564, longitude: 4.914944), radius: 20, identifier: "locatie scheepvaart")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LM = CLLocationManager()
        LM.delegate = self
        LM.requestAlwaysAuthorization()
        self.LM.desiredAccuracy = kCLLocationAccuracyBest
        
        
        self.map.delegate = self // zorgt voor het weergeven van pins als customicons
        let info1 = CustomPointAnnotation()
        info1.coordinate = CLLocationCoordinate2DMake(52.371564, 4.914944)
        info1.title = "Scheepvaartmuseum"
        info1.subtitle = "Binnenplaats"
        info1.imageName = "location7.png"
        map.addAnnotation(info1)
        
        
        LM.startMonitoringForRegion(info7Region) //inforegio1 is buiten viewdidload gedefinieerd
        
        let info2 = CustomPointAnnotation()
        info2.coordinate = CLLocationCoordinate2DMake(52.372150, 4.912202)
        info2.title = "De Amsterdam"
        info2.subtitle = "Amsterdam"
        info2.imageName = "locationgedaan.png"
        map.addAnnotation(info2)
        
        //Route tussen 2 punten vaststellen
        let directionsRequest = MKDirectionsRequest()
        let DeAmsterdam = MKPlacemark(coordinate: CLLocationCoordinate2DMake(info1.coordinate.latitude, info1.coordinate.longitude), addressDictionary: nil)
        
        directionsRequest.source = MKMapItem.mapItemForCurrentLocation() //geeft rechtstreeks de coordinaten voor de huidige locatie
        directionsRequest.destination = MKMapItem(placemark: DeAmsterdam)
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
        
        map.showsUserLocation = true
 
        
    }
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Did enter region")
        self.LM.stopMonitoringForRegion(info7Region)
        self.LM.startUpdatingLocation()
        alertExt("Je bent in de buurt van het Scheepvaartmuseum, een gebouw uit 1556 dat oorspronkelijk een pakhuis voor de marine was. Loop door de ingang naar de binnenplaats voor de volgende opdracht!", title: "Allrighty!")
        MyPlayer.playIt("ting", ext: "wav")

        
        /*let locattionnotification = UILocalNotification()
        locattionnotification.alertBody = "Je bent in de buurt van het Scheepvaartmuseum een gebouw uit 1556 dat als oorspronkelijk een pakhuis was voor de marine. Loop door de ingang naar de binnenplaats voor de volgende opdracht!"
        locattionnotification.soundName = UILocalNotificationDefaultSoundName
        locattionnotification.regionTriggersOnce = true
        locattionnotification.region = info7Region
        UIApplication.sharedApplication().scheduleLocalNotification(locattionnotification)
        print(locattionnotification)
        
        performSegueWithIdentifier("toScheep", sender: nil) //triggered segue als de region is binnengedrongen en geeft log dat de regio is binnengedrongen*/
        
        
    }
    
    //renderen van de lijn die de route weergeeft
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.strokeColor = UIColor.blueColor()
        renderer.lineWidth = 3
        return renderer
        
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
