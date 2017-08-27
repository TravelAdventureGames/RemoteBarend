//
//  naarSluiswachtViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 26-10-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import AVFoundation

class naarSluiswachtViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet var distanceLabel: UILabel!
    
    var LM = CLLocationManager()
    
    @IBOutlet var map: MKMapView!
    
    
    //hier bepaal ik de regio die ik wil monitoren voor entry
    let info11Region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 52.369825, longitude: 4.901623), radius: 10, identifier: "locatie sluyswacht")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LM = CLLocationManager()
        LM.delegate = self
        LM.requestAlwaysAuthorization()
        self.LM.desiredAccuracy = kCLLocationAccuracyBest
        
        
        
        
        self.map.delegate = self // zorgt voor het weergeven van pins als customicons
        let info1 = CustomPointAnnotation()
        info1.coordinate = CLLocationCoordinate2DMake(52.369825, 4.901623)
        info1.title = "Cafe de Sluyswacht"
        info1.subtitle = "Amsterdam"
        info1.imageName = "location11.png"
        map.addAnnotation(info1)
        
        
        LM.startMonitoringForRegion(info11Region) //inforegio1 is buiten viewdidload gedefinieerd
        
        let info2 = CustomPointAnnotation()
        info2.coordinate = CLLocationCoordinate2DMake(52.367454, 4.917934)
        info2.title = "Hortus Botanicus"
        info2.subtitle = "Amsterdam"
        info2.imageName = "locationgedaan.png"
        map.addAnnotation(info2)
        
        //Route tussen 2 punten vaststellen
        let directionsRequest = MKDirectionsRequest()
        let sluyswacht = MKPlacemark(coordinate: CLLocationCoordinate2DMake(info1.coordinate.latitude, info1.coordinate.longitude), addressDictionary: nil)
        
        directionsRequest.source = MKMapItem.mapItemForCurrentLocation() //geeft rechtstreeks de coordinaten voor de huidige locatie
        directionsRequest.destination = MKMapItem(placemark: sluyswacht)
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
        //map.centerCoordinate = location.coordinate
        
        
        
        
        map.showsUserLocation = true
        

        
    }
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Did enter region")
        self.LM.stopMonitoringForRegion(info11Region)
        self.LM.stopUpdatingLocation()
        
    alertExt("Je bent in de buurt van Cafe De Sluyswacht aan de Oudeschans. Er wacht een nieuwe opdracht, dus ga snel verder!", title: "Je bent bij de Oudeschans")
        MyPlayer.playIt("ting", ext: "wav")
        
        
        /*let locattionnotification = UILocalNotification()
        locattionnotification.alertBody = "Je bent in de buurt van Cafe De Sluyswacht! Hier is de volgende opdracht."
        locattionnotification.soundName = UILocalNotificationDefaultSoundName
        locattionnotification.regionTriggersOnce = true
        locattionnotification.region = info11Region
        UIApplication.sharedApplication().scheduleLocalNotification(locattionnotification)
        print(locattionnotification)
        
        performSegueWithIdentifier("naarSluyswacht", sender: nil) //triggered segue als de region is binnengedrongen en geeft log dat de regio is binnengedrongen*/
        
        
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

