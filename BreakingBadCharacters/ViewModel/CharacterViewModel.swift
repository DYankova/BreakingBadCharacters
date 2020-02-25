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
    
    var name : String {
        model.name
    }
    var nameOfCharacter: String {
      "Name: \(name)"
   }
   
   var occupation : String {
      "Occupation : \(model.occupation)"
   }
   
   var status: String {
      "Status : \(model.status)"
   }
   
   var nickName: String {
      "Nickname : \( model.nickName)"
   }

   var seasons: [Int] {
       return model.seasons
   }
   
    func getSeasons() -> String {
       return "Seasons: \(seasons.map{ String($0) })"
   }
  
}
