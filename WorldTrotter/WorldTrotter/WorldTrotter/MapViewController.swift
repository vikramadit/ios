//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Vikram on 10/05/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Map View Is On!")
        mapView = MKMapView()
        view = mapView
        
        // Creating Segment Control
        let segmentControl = UISegmentedControl(items: ["Standard", "Hybrid", "Sattelite"])
        segmentControl.backgroundColor = UIColor.systemBackground
        segmentControl.selectedSegmentIndex = 0
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentControl)
        
        // Adding Target
        segmentControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        
        // Adding Constraints
        let margins = view.layoutMarginsGuide
        let topConstraint = segmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let leadingConstraint = segmentControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        
        // Creating Label
        
        let label = UILabel()
        label.text = "Points Of Interest"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        let topLabelConstraint = label.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 15)
        
        let leadingLabelConstraint = label.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        
        leadingLabelConstraint.isActive = true
        topLabelConstraint.isActive = true
        
        // Creating the Switch
        
        let mySwitch = UISwitch()
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mySwitch)
        
        let topSwitchConstraint = mySwitch.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 10)
        
        let leadingSwitchContraint = mySwitch.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 10)
        
        leadingSwitchContraint.isActive = true
        topSwitchConstraint.isActive = true
        
        // Adding Target for the switch
        
        mySwitch.addTarget(self, action: #selector(switchTapped(_: )), for: .valueChanged)
        
    }
    
    @objc func switchTapped(_ toggle: UISwitch) {
        if toggle.isOn == true {
            mapView.showsPointsOfInterest = true
        }
        else {
            mapView.showsPointsOfInterest = false
        }
        
    }
    
    
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
            
        case 1:
            mapView.mapType = .hybrid
            
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
 
}
