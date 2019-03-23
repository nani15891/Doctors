//
//  ViewController.swift
//  Find a Doctor
//
//  Created by Arun Gattadi on 21/03/19.
//  Copyright © 2019 Calibrage Info System Pvt Ltd. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
protocol CalloutDelegate {
    func callOutDelegateFunctionCallBack()
}
class MapViewController: UIViewController, CLLocationManagerDelegate ,CalloutDelegate{

    @IBOutlet weak var map: MKMapView!
    
    let manager = CLLocationManager()
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        let myLocation1:CLLocationCoordinate2D = CLLocationCoordinate2DMake(17.5007057, 78.3916545)
        let myLocation2:CLLocationCoordinate2D = CLLocationCoordinate2DMake(17.499908, 78.3926118)
        let myLocation3:CLLocationCoordinate2D = CLLocationCoordinate2DMake(17.5003818, 78.3937906)
        let myLocation4:CLLocationCoordinate2D = CLLocationCoordinate2DMake(17.5011765, 78.3920581)
        let myLocation5:CLLocationCoordinate2D = CLLocationCoordinate2DMake(17.5004885, 78.3928015)
        
        let annotation = CustomAnnotation.init(doctorName: "Arun", doctorGender: "M", doctorSpecialization: "Physician", coordinate: myLocation)
        let annotation1 = CustomAnnotation.init(doctorName: "Praveen", doctorGender: "Male", doctorSpecialization: "Cardiologist", coordinate: myLocation1)
        let annotation2 = CustomAnnotation.init(doctorName: "Naveen", doctorGender: "Male", doctorSpecialization: "Dentist", coordinate: myLocation2)
        let annotation3 = CustomAnnotation.init(doctorName: "Venkatesh", doctorGender: "Male", doctorSpecialization: "ENT specialist", coordinate: myLocation3)
        let annotation4 = CustomAnnotation.init(doctorName: "Susmitha", doctorGender: "Female", doctorSpecialization: "Orthopaedician", coordinate: myLocation4)
        let annotation5 = CustomAnnotation.init(doctorName: "Rakesh", doctorGender: "Male", doctorSpecialization: "Psychiatrists", coordinate: myLocation5)
        
        map.addAnnotation(annotation)
        map.addAnnotation(annotation1)
        map.addAnnotation(annotation2)
        map.addAnnotation(annotation3)
        map.addAnnotation(annotation4)
        map.addAnnotation(annotation5)
        
        
        
        
        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
        map.setRegion(region, animated: true)
        map.delegate = self as! MKMapViewDelegate
        self.map.showsUserLocation = false
        
        
    }
    
    func callOutDelegateFunctionCallBack(){
        print("delegate called")
        
        
        let DoctorDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DoctorDetailsViewController") as! DoctorDetailsViewController
        self.navigationController?.pushViewController(DoctorDetailsVC, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         self.navigationItem.title = "Map"
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation)
        -> MKAnnotationView? {
            
            let reuseId = "test"
            
            var anView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
            if anView == nil {
                anView = CustomCalloutView(annotation: annotation, reuseIdentifier: reuseId)
                anView!.canShowCallout = false
            }
            else {
                anView!.annotation = annotation
            }
            anView!.image = UIImage(named:"Info")
            return anView
    }
    
    func mapView(_ mapView: MKMapView,
                 didSelect view: MKAnnotationView)
    {
        let annotaion = view.annotation as! CustomAnnotation
        let customView = (Bundle.main.loadNibNamed("CustomCalloutView", owner: self, options: nil))?[0] as! CustomCalloutView;
        customView.name.text = annotaion.doctorName
        customView.gender.text = annotaion.doctorGender
        customView.designation.text = annotaion.doctorSpecialization
        customView.calloutDelegate = self
        let calloutViewFrame = customView.frame;
        customView.frame = CGRect(x: -calloutViewFrame.size.width/2.23, y: -calloutViewFrame.size.height, width: 200, height: 150)
        view.addSubview(customView)
        //  mapView.setCenter((view.annotation?.coordinate)!, animated: true)
    }
    
    @objc func callPhoneNumber(sender: UIButton){
        print("image clicked")
    }
    
    @objc func imageClicked(_ sender:UITapGestureRecognizer){
        
        print("image clicked")
        
    }
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        
        for childView:AnyObject in view.subviews{
            childView.removeFromSuperview();
        }
        
    }
}

