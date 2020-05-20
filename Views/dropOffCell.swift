//
//  dropOffCell.swift
//  LyftClone
//
//  Created by Blaike Bradford on 5/20/20.
//  Copyright © 2020 Blaike Bradford. All rights reserved.
//

import UIKit

class dropOffCell: UITableViewCell{
    
    let markerImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "marker")
        image.backgroundColor = .white
        return image
    }()
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?)
    {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(markerImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(addressLabel)
        contentView.backgroundColor = .white
        
        
        markerImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        markerImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        markerImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        markerImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        titleLabel.leadingAnchor.constraint(equalTo: markerImage.trailingAnchor, constant: 10).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 8/10).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/2).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -5).isActive = true

        addressLabel.leadingAnchor.constraint(equalTo: markerImage.trailingAnchor, constant: 10).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 8/10).isActive = true
        addressLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/2).isActive = true
        addressLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 1).isActive = true
    }
    
    func update(location: Location)
    {
        titleLabel.text = location.title
        addressLabel.text = location.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
