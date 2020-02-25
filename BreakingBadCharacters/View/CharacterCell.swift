//
//  CharacterCell.swift
//  BreakingBadCharacters
//
//  Created by Didi on 21.02.20.
//  Copyright © 2020 Didi. All rights reserved.
//

import UIKit
import SnapKit
class CharacterCell:  UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    lazy var imageView: CustomImageView = {
        let iv = CustomImageView()
        if let image = UIImage(named: "close") {
            iv.image = image
        }
        return iv
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Robonto", size: 20)
        return label
    }()

   private func addViews() {
        addSubview(imageView)
        addSubview(textLabel)
    }
    private func addConstraints(){
        
        imageView.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.leading).offset(Constants.padding)
            make.top.equalTo(self.snp.top).offset(Constants.padding)
            make.height.width.equalTo(Constants.cellHeight)
        }
        
        textLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(Constants.paddingSmall)
            make.top.equalTo(self.snp.top).offset(Constants.padding)
            make.trailing.equalTo(self.snp.trailing).offset(-Constants.padding)
        }

    }
}



