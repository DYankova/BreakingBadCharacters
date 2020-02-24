//
//  CharacterViewModel.swift
//  BreakingBadCharacters
//
//  Created by Didi on 21.02.20.
//  Copyright © 2020 Didi. All rights reserved.
//

import UIKit
import AlamofireImage

import Alamofire

class CharacterViewModel {

    let model: CharacterModel
    var imageView = CustomImageView()
    
    var imageUrl: URL {
        return URL(string: model.imageUrl)!
    }
    
    init(_ model: CharacterModel) {
        self.model = model
        self.imageView.af_setImage(withURL: imageUrl)
   
    }
    
    var name: String {
        model.name
    }
    
    var occupation : String {
        model.occupation
    }
    
    var status: String {
        model.status
    }
    
    var nickName: String {
        model.nickName
    }

    var seasons: [Int] {
        return model.seasons
    }
  
}
