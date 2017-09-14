//
//  ViewController.swift
//  MapView02
//
//  Created by D7703_18 on 2017. 9. 14..
//  Copyright © 2017년 D7703_18. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var myView: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Ceter()
        
        let a = PinPoint(coordinate: CLLocationCoordinate2D(latitude: 35.166197, longitude: 129.072594), title: "동의과학대학교", subtitle: "우리들의 꿈이 자라는 곳")
        let b = PinPoint(coordinate: CLLocationCoordinate2D(latitude: 35.168444, longitude: 129.057832), title: "부산시민공원", subtitle: "부산 시민들의 휴식처")
        let c = PinPoint(coordinate: CLLocationCoordinate2D(latitude: 35.164199, longitude: 129.064894), title: "송상현광장", subtitle: "광장")
        
        
        myView.addAnnotations([a,b,c])
        myView.delegate = self
    }
    
    
    
    func Ceter() {
        let center = CLLocationCoordinate2DMake(35.166197, 129.072594)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(center, span)
        
        myView.setRegion(region, animated: true)
    }

    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // pin의 재활용
        let identifier = "MyPin"
        var annotationView = myView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        if annotationView == nil { //처음이면 실행
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            
            annotationView?.canShowCallout = true
            annotationView?.animatesDrop = true
            // Right calloutAcceary
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
            
            if annotation.title! == "부산시민공원" {
                annotationView?.pinTintColor = UIColor.blue
                
                // Left CalloutAcceary
                let IconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
                IconView.image = UIImage(named: "31.jpg")
                annotationView?.leftCalloutAccessoryView = IconView
                
            } else if annotation.title! == "동의과학대학교" {
                annotationView?.pinTintColor = UIColor.green
    
                // Left CalloutAcceary
                let IconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
                IconView.image = UIImage(named: "32.gif")
                annotationView?.leftCalloutAccessoryView = IconView
                
            } else if annotation.title! == "송상현광장" {
                
                
                // Left CalloutAcceary
                let IconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
                IconView.image = UIImage(named: "33.jpg")
                annotationView?.leftCalloutAccessoryView = IconView
            }
            
        } else {
            // nil이 아닌경우 이미 만들어진 것을 재활용
            annotationView?.annotation = annotation
        }
        return annotationView
    }
    
    
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        // print("callout Accessory Tapped!")
        
        let viewAnno = view.annotation
        let viewTitle: String = ((viewAnno?.title)!)!
        let viewSubTitle: String = ((viewAnno?.subtitle)!)!
        
        print("\(viewTitle) \(viewSubTitle)")
        
        let ac = UIAlertController(title: viewTitle, message: viewSubTitle, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

