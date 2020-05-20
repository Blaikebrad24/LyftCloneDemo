//
//  RouteViewController.swift
//  LyftClone
//
//  Created by Blaike Bradford on 5/19/20.
//  Copyright © 2020 Blaike Bradford. All rights reserved.
//

import UIKit

class LocationController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var locations = [Location]()
    var pickupLocation: Location?
    var dropOffLocation: Location?
    
    
    let currentLocationImage: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "marker")
        return imageView
    }()
    
    let destinationLocationImage: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "destinationMarker")
        return imageView
    }()
    
    let currentLocationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        label.backgroundColor = .white
        label.text = "Current Location"
        return label
    }()
    
    let destinationLocationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        label.backgroundColor = .white
        label.text = "Destination Location"
        return label
    }()
    
    let destinationSmallLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .purple
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 10)
        label.backgroundColor = .white
        label.text = "Destination Location"
        return label
    }()
    let currentLocationSmallLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 10)
        label.backgroundColor = .white
        label.text = "Destination Location"
        return label
    }()
    
    var destinationOptionsCell = "optionsCell"
    var optionsTable = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        locations = LocationServices.shared.getRecentLocations()
        addElements()
        setupView()
    }
    
    func addElements()
    {
//        self.view.addSubview(destinationSmallLabel)
//        self.view.addSubview(destinationLocationImage)
//        self.view.addSubview(destinationLocationLabel)
        self.view.addSubview(optionsTable)
//        self.view.addSubview(currentLocationImage)
//        self.view.addSubview(currentLocationSmallLabel)
//        self.view.addSubview(currentLocationLabel)
    }
    
    func setupView()
    {
        optionsTable.translatesAutoresizingMaskIntoConstraints = false
        optionsTable.delegate = self
        optionsTable.dataSource = self
        optionsTable.register(dropOffCell.self, forCellReuseIdentifier: destinationOptionsCell)
        view.addSubview(optionsTable)
        
        optionsTable.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 3.5/5).isActive = true
        optionsTable.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        optionsTable.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75).isActive = true
        optionsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        optionsTable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
//        view.addSubview(currentLocationImage)
//        currentLocationImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        currentLocationImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
//        currentLocationImage.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
//        currentLocationImage.centerYAnchor.constraint(equalTo: destinationLocationImage.topAnchor, constant: -10).isActive = true
//
//        view.addSubview(currentLocationSmallLabel)
//        currentLocationSmallLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/10).isActive = true
//        currentLocationSmallLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        currentLocationSmallLabel.leadingAnchor.constraint(equalTo: currentLocationImage.trailingAnchor).isActive = true
//        currentLocationSmallLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: destinationOptionsCell, for: indexPath) as? dropOffCell ?? dropOffCell()
        cell.selectionStyle = .none
        let location = locations[indexPath.row]
        cell.update(location: location)
        return cell
    }
    
}
