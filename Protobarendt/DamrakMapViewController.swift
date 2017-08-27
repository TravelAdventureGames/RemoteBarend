//
//  DamrakMapViewController.swift
//  Protobarendt
//
//  Created by Martijn van Gogh on 03-09-15.
//  Copyright © 2015 Martijn van Gogh. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import AVFoundation


class DamrakMapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var map: MKMapView!
    
    var LM = CLLocationManager()
    let info2Region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 52.376286, longitude: 4.900075), radius: 10, identifier: "locatie Aepjen")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        LM = CLLocationManager()
        LM.delegate = self
        LM.requestAlwaysAuthorization()
        self.LM.desiredAccuracy = kCLLocationAccuracyBest
        
        self.map.delegate = self // zorgt voor het weergeven van pins als customicons
        let info1 = CustomPointAnnotation()
        info1.coordinate = CLLocationCoordinate2DMake(52.373259, 4.892651)
        info1.title = "Damrak"
        info1.subtitle = "Amsterdam"
        info1.imageName = "locationgedaan.png"
        map.addAnnotation(info1)
        
        //hier bepaal ik de regio die ik wil monitoren voor entry
        
        LM.startMonitoringForRegion(info2Region)
        
        let info2 = CustomPointAnnotation()
        info2.coordinate = CLLocationCoordinate2DMake(52.376286, 4.900075)
        info2.title = "'T Aepjen"
        info2.subtitle = "Amsterdam"
        info2.imageName = "location2.png"
        map.addAnnotation(info2)
        
        //Route tussen 2 punten vaststellen
        let directionsRequest = MKDirectionsRequest()
        let aepjen = MKPlacemark(coordinate: CLLocationCoordinate2DMake(info2.coordinate.latitude, info2.coordinate.longitude), addressDictionary: nil)
        
        directionsRequest.source = MKMapItem.mapItemForCurrentLocation() //geeft rechtstreeks de coordinaten voor de huidige locatie
        directionsRequest.destination = MKMapItem(placemark: aepjen)
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
        self.LM.stopMonitoringForRegion(info2Region)
        self.LM.stopUpdatingLocation()
        
        /*let locattionnotification = UILocalNotification()
        locattionnotification.alertBody = "Je hebt de locatie bereikt! Ga snel verder, want er wacht een nieuwe opdracht!"
        locattionnotification.soundName = UILocalNotificationDefaultSoundName
        locattionnotification.regionTriggersOnce = true
        locattionnotification.region = info2Region
        UIApplication.sharedApplication().scheduleLocalNotification(locattionnotification)
        print(locattionnotification)*/
        
        alertExt("Je bent in de buurt van 'in 't Aepjen, de oudste herberg van Amsterdam. Ga er precies voor staan en ga naar het volgende scherm voor het  vreselijke verhaal van Barendt en Aaltje!", title: "Perfect!")
        MyPlayer.playIt("ting", ext: "wav")
        LM.stopMonitoringForRegion(info2Region)
        
        
        
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        LM.stopUpdatingLocation()
        LM.stopMonitoringForRegion(info2Region)
    }
    
    
    
}






