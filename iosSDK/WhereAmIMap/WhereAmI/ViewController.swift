//
//  ViewController.swift
//  WhereAmI
//
//  Created by  wj on 16/1/30.
//  Copyright © 2016年 gzq. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    private var previousPoint:CLLocation?
    private var totalMovementDistance:CLLocationDistance = 0

    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var horizontalAccuracyLabel: UILabel!
    @IBOutlet weak var altitudeLabel: UILabel!
    @IBOutlet weak var verticalAccuracyLabel: UILabel!
    @IBOutlet weak var distanceTraveledLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
       //locationManager.requestAlwaysAuthorization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        print("授权状态改变\(status.rawValue)")
        switch status{
        case .AuthorizedWhenInUse:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
        default:
            locationManager.stopUpdatingLocation()
            mapView.showsUserLocation = false
        }
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        let errorType = error.code == CLError.Denied.rawValue ? "访问拒绝" : "Error \(error.code)"
        let alertController = UIAlertController(title: "位置管理错误", message: errorType, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
        alertController.addAction(okAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations[locations.count - 1]
        let latitudeString = String(format: "%g\u{00B0}", newLocation.coordinate.latitude)
        latitudeLabel.text = latitudeString
        let longitudeString = String(format: "%g\u{00B0}", newLocation.coordinate.longitude)
        longitudeLabel.text = longitudeString
        let horizontalAccuracyString = String(format: "%gm", newLocation.horizontalAccuracy)
        horizontalAccuracyLabel.text = horizontalAccuracyString
        let altitudeString = String(format: "%gm", newLocation.altitude)
        altitudeLabel.text = altitudeString
        
        let verticalAccuracyString = String(format: "%gm", newLocation.verticalAccuracy)
        verticalAccuracyLabel.text = verticalAccuracyString
        
        if newLocation.horizontalAccuracy < 0 {
            return
        }
        if newLocation.horizontalAccuracy > 100 || newLocation.verticalAccuracy > 50{
            return
        }
        if previousPoint == nil{
            totalMovementDistance = 0
            
            let start = Place(title: "起点", subtitle: "开始的地方", coordinate: newLocation.coordinate)
            mapView.addAnnotation(start)
            
            let region = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 100, 100)
            mapView.setRegion(region, animated: true)
        }else{
            print("movement distance:" + "\(newLocation.distanceFromLocation(previousPoint!))")
            totalMovementDistance += newLocation.distanceFromLocation(previousPoint!)
        }
        previousPoint = newLocation
        
        let distanceString = String(format: "%gm", totalMovementDistance)
        distanceTraveledLabel.text = distanceString
    }
}

