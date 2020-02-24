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
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()

    lazy var searchByNameField = SearchField()

    lazy var searchBySeasonField : SearchField = {
        let field = SearchField()
        field.placeholder = "Season"
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
            make.top.equalTo(view.snp.top).offset(60)
            make.trailing.equalTo(view.snp.trailing).offset(-Constants.padding)
            make.height.equalTo(40)
            make.width.equalTo(50)
        }
        
        searchBySeasonField.snp.makeConstraints { make in
            make.trailing.equalTo(searchButton.snp.leading).offset(-10)
            make.top.equalTo(searchButton.snp.top)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }
        
        searchByNameField.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(20)
            make.top.equalTo(searchButton.snp.top)
            make.trailing.equalTo(searchBySeasonField.snp.leading).offset(-10)
            make.height.equalTo(40)
        }
     
        collectionView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading)
            make.top.equalTo(searchButton.snp.bottom).offset(20)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
            //test
            //move to VM
    @objc private func search(){
//        itunesFetcher.cleanResults()
//        let seconds = 1.5
//            self.itunesFetcher.getItems(symbol: self.searchTextField.text ?? "")
//            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
//                self.collectionView.reloadData()
//        }
    }
    
}

extension CharactersListViewController:  UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return charsViewModel.charViewModels.count
    }
    
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        cell.textLabel.text = charsViewModel.charViewModels[indexPath.item].name
        cell.imageView.image = charsViewModel.charViewModels[indexPath.item].imageView.image
        return cell
    }
    
}

extension CharactersListViewController:  UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: Constants.cellHeight)
   }
           
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentItemViewModel =  charsViewModel.charViewModels[indexPath.item]
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
