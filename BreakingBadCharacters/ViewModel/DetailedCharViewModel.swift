//
//  DetailedCharViewModel.swift
//  BreakingBadCharacters
//
//  Created by Didi on 24.02.20.
//  Copyright © 2020 Didi. All rights reserved.
//

import UIKit

class DetailedCharViewModel {

    let model: CharacterModel
    var imageView = CustomImageView()

    init(_ model: CharacterModel) {
        self.model = model
    }

    var name: String {
       "Name: \( model.name)"
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
