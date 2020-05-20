//
//  HomeViewController.swift
//  LyftClone
//
//  Created by Blaike Bradford on 5/11/20.
//  Copyright © 2020 Blaike Bradford. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate, MKMapViewDelegate{

    
    
    
    var destinationCell = "destinationCell"
    var destinationTableView = UITableView()
    
    let mainView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let theMapView: MKMapView = {
       let mapkit = MKMapView()
        mapkit.translatesAutoresizingMaskIntoConstraints = false
        mapkit.tintColor = .blue
        return mapkit
    }()
    
    let label_1: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Rise and Shine"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        label.backgroundColor = .white
        return label
    }()
    
    let label_2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Where are you going?"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        label.backgroundColor = .white
            
           return label
       }()
    
    let searchButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Search destination", for: .normal)
        btn.setTitleColor(UIColor.lightGray, for: .normal)
        btn.backgroundColor = .white
        btn.layer.masksToBounds = false
        btn.layer.cornerRadius = 10.0
        btn.layer.shadowRadius = 1.0
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        btn.layer.shadowOpacity = 0.5
        btn.setImage(#imageLiteral(resourceName: "find.png"), for: .normal)
        return btn
    }()
    
    let searchImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = #imageLiteral(resourceName: "find.png")
//        image.backgroundColor = UIColor(displayP3Red: 235/255.0, green: 237/255.0, blue: 240/255.0, alpha: 1.0)
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    
    var locations = [Location]()
    var locationManager: CLLocationManager!
    var currentUserLocation: Location!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theMapView.delegate = self
        theMapView.showsUserLocation = true
        theMapView.userTrackingMode = .follow
        let recentLocations = LocationServices.shared.getRecentLocations()
        locations = [recentLocations[0], recentLocations[1]]
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //request authorization
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse
        {
            locationManager.startUpdatingLocation()
        }
        
        addElements()
        setupElements()
        setupTableView()
    }
    
    //function to add the created objects to the viewcontroller
    func addElements()
    {
        self.view.addSubview(mainView)
        self.view.addSubview(theMapView)
        self.view.addSubview(label_1)
        self.view.addSubview(label_2)
        self.view.addSubview(searchButton)
//        self.view.addSubview(searchImage)
        self.view.addSubview(destinationTableView)
        
    }
    
    // function to set up coordinates of objects in the view
    func setupElements()
    {
        mainView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive   = true
        mainView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive     = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        mainView.addSubview(theMapView)
        theMapView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true 
        theMapView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 6.5/10).isActive = true
        theMapView.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
        theMapView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor).isActive = true
        theMapView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        
        mainView.addSubview(label_1)
        label_1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        label_1.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
        label_1.topAnchor.constraint(equalTo: theMapView.bottomAnchor, constant: 3).isActive = true
        label_1.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20).isActive = true
        
        mainView.addSubview(label_2)
        label_2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        label_2.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
        label_2.topAnchor.constraint(equalTo: label_1.bottomAnchor, constant: 3).isActive = true
        label_2.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20).isActive = true
        
        mainView.addSubview(searchButton)
        searchButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10).isActive = true
        searchButton.topAnchor.constraint(equalTo: label_2.bottomAnchor).isActive = true
        
//        mainView.addSubview(searchImage)
//        searchImage.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20).isActive = true
//        searchImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
//        searchImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        searchImage.topAnchor.constraint(equalTo: label_2.bottomAnchor).isActive = true


    }
    
    func setupTableView()
    {
       
        destinationTableView.delegate = self //conforming to protocols
        destinationTableView.dataSource = self//conforming to protocols
        
        destinationTableView.register(searchDestinationCell.self, forCellReuseIdentifier: destinationCell)
        
        mainView.addSubview(destinationTableView)
        destinationTableView.translatesAutoresizingMaskIntoConstraints = false
        destinationTableView.separatorColor = .lightGray
        destinationTableView.backgroundColor = .white
        destinationTableView.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 10).isActive = true
        destinationTableView.widthAnchor.constraint(equalTo: mainView.widthAnchor).isActive = true
        destinationTableView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let firstLocation = locations.first!
        currentUserLocation = Location(title: "Current Location", subtitle: "", latitude: firstLocation.coordinate.latitude, longitude: firstLocation.coordinate.longitude)
        // we dont need to keep getting/updating location, so step the method
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse{
            locationManager.startUpdatingLocation()
        }
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        //zoom in
        
        let distance = 200.0
        let region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: distance, longitudinalMeters: distance)
        mapView.setRegion(region, animated: true)
        
        let lat = userLocation.coordinate.latitude
        let long = userLocation.coordinate.longitude
        let offset = 0.00075
        
        let coordinate_1 = CLLocationCoordinate2D(latitude: lat - offset, longitude: long - offset)
        let coordinate_2 = CLLocationCoordinate2D(latitude: lat, longitude: long + offset)
        let coordinate_3 =  CLLocationCoordinate2D(latitude: lat, longitude: long - offset)
        
        mapView.addAnnotations([
        
            VehicleClass(coordinate: coordinate_1),
            VehicleClass(coordinate: coordinate_2),
            VehicleClass(coordinate: coordinate_3)
        ])
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation{
            return nil
        }
        let identifier = "VehicleAnnotation"
        var annotationView =  mapView.dequeueReusableAnnotationView(withIdentifier: "VehicleAnnotation")
        if annotationView == nil{
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }else{
            annotationView?.annotation = annotation
        }
        annotationView?.image = UIImage(named: "car")
        
        return annotationView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: destinationCell, for: indexPath) as? searchDestinationCell ?? searchDestinationCell()
        cell.selectionStyle = .none
        cell.backgroundColor = .white
        let location = locations[indexPath.row]
        cell.update(location: location)
        return cell
    }
    
}
