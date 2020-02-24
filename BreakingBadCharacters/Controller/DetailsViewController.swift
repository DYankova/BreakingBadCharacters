//
//  DetailsViewController.swift
//  BreakingBadCharacters
//
//  Created by Didi on 21.02.20.
//  Copyright © 2020 Didi. All rights reserved.
//

import UIKit
import SnapKit

class DetailsViewController: UIViewController {
    
    var characterViewModel: CharacterViewModel!
    
    lazy var imageView: CustomImageView = {
        let iv = CustomImageView()
        return iv
    }()
            
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.darkGray
        return label
    }()
      
    lazy var occupationLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.darkGray
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.darkGray
        return label
    }()
    
    lazy var nicknameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.darkGray

        return label
    }()
    
    lazy var seasonsLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.darkGray
        return label
    }()
        
    lazy var closeButton: UIButton = {
        let btn = UIButton()
        if let image = UIImage(named: "close") {
            btn.setImage(image, for: .normal)
        }
        btn.addTarget(self, action: #selector(close), for: .touchUpInside)
        return btn
   }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setupViews()
        addConstraints()
        
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
      }
          
    private func setupViews(){
        view.backgroundColor = Constants.backgroundColor
        imageView.image = characterViewModel.imageView.image
        nameLabel.text = characterViewModel.name
        occupationLabel.text = characterViewModel.occupation
        statusLabel.text = characterViewModel.status
        nicknameLabel.text = characterViewModel.nickName
        seasonsLabel.text = characterViewModel.getSeasons()
    }
    
    private func addViews() {
        view.addSubview(closeButton)
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(occupationLabel)
        view.addSubview(statusLabel)
        view.addSubview(nicknameLabel)
        view.addSubview(seasonsLabel)
    }

    private func addConstraints(){
        closeButton.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(40)
            make.height.width.equalTo(25)
        }
        
        imageView.snp.makeConstraints { make in
            make.leading.equalTo(closeButton.snp.trailing)
            make.top.equalTo(closeButton.snp.bottom).offset(Constants.padding)
            make.height.equalTo(200)
            make.width.equalTo(170)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.leading)
            make.top.equalTo(imageView.snp.bottom).offset(Constants.padding)
            make.height.equalTo(Constants.padding)
        }
        
        occupationLabel.snp.makeConstraints { make in
           make.leading.equalTo(nameLabel.snp.leading)
           make.top.equalTo(nameLabel.snp.bottom).offset(Constants.padding)
           make.height.equalTo(Constants.padding)
        }
        
        statusLabel.snp.makeConstraints { make in
          make.leading.equalTo(occupationLabel.snp.leading)
          make.top.equalTo(occupationLabel.snp.bottom).offset(Constants.padding)
          make.height.equalTo(Constants.padding)
        }
        
        nicknameLabel.snp.makeConstraints { make in
            make.leading.equalTo(statusLabel.snp.leading)
            make.top.equalTo(statusLabel.snp.bottom).offset(Constants.padding)
            make.height.equalTo(Constants.padding)
        }
        
        seasonsLabel.snp.makeConstraints { make in
            make.leading.equalTo(nicknameLabel.snp.leading)
            make.top.equalTo(nicknameLabel.snp.bottom).offset(Constants.padding)
            make.height.equalTo(Constants.padding)
        }
        
    }
    
    @objc private func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
