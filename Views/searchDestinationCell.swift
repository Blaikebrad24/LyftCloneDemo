//
//  searchDestinationCell.swift
//  LyftClone
//
//  Created by Blaike Bradford on 5/12/20.
//  Copyright © 2020 Blaike Bradford. All rights reserved.
//

import Foundation
import UIKit


class searchDestinationCell: UITableViewCell {
    
    let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
        label.textColor = .black
        label.text = "Destination Title"
        return label
    }()
    let addressLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.semibold)
        label.textColor = .black
        label.text = "Address of Destination"
        return label
    }()
    
    let pinImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = #imageLiteral(resourceName: "marker")
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(addressLabel)
        contentView.addSubview(pinImage)
        contentView.backgroundColor = .white

        pinImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        pinImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        pinImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        pinImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        titleLabel.leadingAnchor.constraint(equalTo: pinImage.trailingAnchor, constant: 10).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 8/10).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/2).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -5).isActive = true

        addressLabel.leadingAnchor.constraint(equalTo: pinImage.trailingAnchor, constant: 10).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 8/10).isActive = true
        addressLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/2).isActive = true
        addressLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 1).isActive = true
    }
    
    //so this class can handle its own objects
    func update(location: Location)
    {
        titleLabel.text = location.title
        addressLabel.text = location.subtitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
