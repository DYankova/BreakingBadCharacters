//
//  ViewController.swift
//  BreakingBadCharacters
//
//  Created by Didi on 21.02.20.
//  Copyright © 2020 Didi. All rights reserved.
//

import UIKit

class CharactersListViewController: UIViewController {
        
    let fetcher = Fetcher()
//    var charModels = [CharacterViewModel]()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    lazy var searchTextField = SearchCharField()

    lazy var searchButton = SearchButton()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetcher.fetchAllcharacters { (charModels) in
            self.collectionView.reloadData()
        }
        view.backgroundColor = .white
        
        view.addSubview(searchTextField)
        view.addSubview(searchButton)
        view.addSubview(collectionView)
  
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: "CharacterCell")
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
   
    private func setupConstraints() {
        searchButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        searchButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
           
        searchTextField.topAnchor.constraint(equalTo: searchButton.topAnchor).isActive = true
        searchTextField.rightAnchor.constraint(equalTo: searchButton.leftAnchor, constant: -20).isActive = true
        searchTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant:  40).isActive = true
       
        collectionView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
        
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
        return fetcher.charModels.count
    }
    
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        cell.textLabel.text = fetcher.charModels[indexPath.item].name
        cell.imageView.image = fetcher.charModels[indexPath.item].imageView.image

        return cell
    }
    
}

extension CharactersListViewController:  UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: Constants.cellHeight)
   }
           
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentItemViewModel =  fetcher.charModels[indexPath.item]
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
