//
//  CharacterCell.swift
//  BreakingBadCharacters
//
//  Created by Didi on 21.02.20.
//  Copyright © 2020 Didi. All rights reserved.
//

import UIKit

class CharacterCell:  UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    lazy var imageView: CustomImageView = {
        let iv = CustomImageView()
//        if let image = UIImage(named: "download") {
//            iv.image = image
//        }
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Robonto", size: 20)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

   private func setupViews() {
        addSubview(imageView)
        addSubview(textLabel)
    
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 40 ).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 40 ).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        
        textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25).isActive = true
        textLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 10).isActive = true
        textLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
    }
}



