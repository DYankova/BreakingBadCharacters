//
//  DetailsViewController.swift
//  BreakingBadCharacters
//
//  Created by Didi on 21.02.20.
//  Copyright © 2020 Didi. All rights reserved.
//

import UIKit
import SnapKit

class CharacterViewController: UIViewController {
    
    var characterViewModel: CharacterViewModel!
    
    lazy var imageView: CustomImageView = {
        let iv = CustomImageView()
        return iv
    }()
            
    lazy var nameLabel = UILabel()
      
    lazy var occupationLabel = UILabel()
    
    lazy var statusLabel = UILabel()
    
    lazy var nicknameLabel = UILabel()
    
    lazy var seasonsLabel = UILabel()
        
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
        nameLabel.text = characterViewModel.nameOfCharacter
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
            make.top.leading.equalToSuperview().offset(Constants.cellHeight)
            make.height.width.equalTo(Constants.padding)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(closeButton.snp.bottom).offset(Constants.padding)
            make.leading.equalTo(closeButton.snp.trailing)
            make.height.equalTo(Constants.imageHeight)
            make.width.equalTo(Constants.imageWidth)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(Constants.padding)
            make.leading.equalTo(imageView.snp.leading)
            make.height.equalTo(Constants.padding)
        }
        
        occupationLabel.snp.makeConstraints { make in
           make.top.equalTo(nameLabel.snp.bottom).offset(Constants.padding)
           make.leading.equalTo(nameLabel.snp.leading)
           make.height.equalTo(Constants.padding)
        }
        
        statusLabel.snp.makeConstraints { make in
          make.top.equalTo(occupationLabel.snp.bottom).offset(Constants.padding)
          make.leading.equalTo(occupationLabel.snp.leading)
          make.height.equalTo(Constants.padding)
        }
        
        nicknameLabel.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.bottom).offset(Constants.padding)
            make.leading.equalTo(statusLabel.snp.leading)
            make.height.equalTo(Constants.padding)
        }
        
        seasonsLabel.snp.makeConstraints { make in
            make.top.equalTo(nicknameLabel.snp.bottom).offset(Constants.padding)
            make.leading.equalTo(nicknameLabel.snp.leading)
            make.height.equalTo(Constants.padding)
        }
    }
    
    @objc private func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
