//
//  ViewController.swift
//  BreakingBadCharacters
//
//  Created by Didi on 21.02.20.
//  Copyright © 2020 Didi. All rights reserved.
//

import UIKit
import SnapKit

class CharactersListViewController: UIViewController {

    let charsViewModel = CharsViewModel()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()

    lazy var searchByNameField = SearchField()

    lazy var searchBySeasonField : SearchField = {
        let field = SearchField()
        field.placeholder = "Season"
        field.keyboardType = .numberPad
        return field
    }()
    
    lazy var searchButton = SearchButton()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.charsViewModel.fetchData { () in
            self.collectionView.reloadData()
        }
      
        view.backgroundColor = Constants.backgroundColor
        
        addViews()
        setupCV()
        addConstraints()
        searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    private func addViews(){
        view.addSubview(searchByNameField)
        view.addSubview(searchBySeasonField)
        view.addSubview(searchButton)
        view.addSubview(collectionView)
    }
   
    private func setupCV(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: "CharacterCell")
    }
    
    private func addConstraints() {
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(Constants.searchWidth)
            make.trailing.equalTo(view.snp.trailing).offset(-Constants.padding)
            make.height.equalTo(Constants.cellHeight)
            make.width.equalTo(Constants.searchWidth)
        }
        
        searchBySeasonField.snp.makeConstraints { make in
            make.top.equalTo(searchButton.snp.top)
            make.trailing.equalTo(searchButton.snp.leading).offset(-Constants.paddingSmall)
            make.height.equalTo(Constants.cellHeight)
            make.width.equalTo(Constants.searchWidth)
        }
        
        searchByNameField.snp.makeConstraints { make in
            make.top.equalTo(searchButton.snp.top)
            make.leading.equalTo(view.snp.leading).offset(Constants.padding)
            make.trailing.equalTo(searchBySeasonField.snp.leading).offset(-Constants.paddingSmall)
            make.height.equalTo(Constants.cellHeight)
        }
     
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchButton.snp.bottom).offset(Constants.padding)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
         
    @objc private func search(){
        guard let name = searchByNameField.text else { return }
        guard let seasonText = searchBySeasonField.text else { return }
        charsViewModel.searchCharacters(name, seasonText)
        
        self.collectionView.reloadData()
    }
}

extension CharactersListViewController:  UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return charsViewModel.currentCharViewModels.count
    }
    
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        cell.textLabel.text = charsViewModel.currentCharViewModels[indexPath.item].name
        cell.imageView.image = charsViewModel.currentCharViewModels[indexPath.item].imageView.image
        return cell
    }
    
}

extension CharactersListViewController:  UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: Constants.cellHeight)
   }
           
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentItemViewModel =  charsViewModel.currentCharViewModels[indexPath.item]
        let detailsViewController =  DetailsViewController()
        detailsViewController.characterViewModel = currentItemViewModel
        detailsViewController.modalPresentationStyle = .fullScreen
        self.present(detailsViewController, animated: true, completion: nil)
   }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
