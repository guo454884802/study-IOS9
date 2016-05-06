//
//  MapViewController.swift
//  FoodPin
//
//  Created by  wj on 15/10/15.
//  Copyright © 2015年 gzq. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var restaurant:Restaurant!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let geoCode = CLGeocoder()
        geoCode.geocodeAddressString("云南省昆明市五华区翠湖北路2号") { (placemarks, error) -> Void in
            if error != nil{
                print(error)
                return
            }
            if let placemarks = placemarks{
                //得到坐标“只需数组的第一个元素”
                let placemark = placemarks[0]
                
                //增加指示箭头
                let annotation = MKPointAnnotation()
                annotation.title = "guozhiqiang" //self.restaurant.name
                annotation.subtitle = "china" //self.restaurant.type
                
                if let location = placemark.location{
                    annotation.coordinate = location.coordinate
                    //展示指示箭头
                    self.mapView.showAnnotations([annotation], animated: true)
                    //直接title和subtitle
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
        }
        //定义mapview代理是MapViewController
        mapView.delegate = self
       // mapView.showsCompass = true
        mapView.showsScale = true
        mapView.showsTraffic = true
        // Do any additional setup after loading the view.
    }
    //map view需要annotation view时，就会调用次方法
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        
        if annotation.isKindOfClass(MKUserLocation){
            return nil
        }
        //重用只是箭头
        var annotationView:MKPinAnnotationView? = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        //如果没有可以重用的，创建一个
        if annotationView == nil{
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        //添加一个左iconview，设置餐馆图片
        let leftIconView = UIImageView(frame: CGRectMake(0, 0, 53, 53))
        leftIconView.image = UIImage(named: "cafedeadend.jpg")
        annotationView?.leftCalloutAccessoryView = leftIconView
        //设置指示箭头的颜色
        annotationView?.pinTintColor = UIColor.orangeColor()
        return annotationView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
