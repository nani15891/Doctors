//
//  ViewController.swift
//  Find a Doctor
//
//  Created by Arun Gattadi on 21/03/19.
//  Copyright © 2019 Calibrage Info System Pvt Ltd. All rights reserved.
//

import UIKit
import MapKit

class CustomCalloutView: MKAnnotationView {

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var designation: UILabel!
    
    var calloutDelegate : CalloutDelegate?
    @IBAction func goButton(_ sender: AnyObject) {
        if let delegate = self.calloutDelegate{
            delegate.callOutDelegateFunctionCallBack()
        }
        print("button clicked sucessfully")
    }

   
  
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, with: event)
        if hitView != nil {
            superview?.bringSubviewToFront(self)
        }
        return hitView
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let rect = self.bounds
        var isInside = rect.contains(point)
        if !isInside {
            for view in subviews {
                isInside = view.frame.contains(point)
                if isInside {
                    break
                }
            }
        }
        return isInside
    }
}
