//
//  CharacterModel.swift
//  BreakingBadCharacters
//
//  Created by Didi on 21.02.20.
//  Copyright © 2020 Didi. All rights reserved.
//

import UIKit

struct CharacterModel: Codable {

    let name : String
    let occupation : String
    let status : String
    let nickName: String
    let seasons: [Int]
    let imageUrl : String
         
    init(_ dictionary:  [String: Any])  {
        self.name = dictionary["name"] as? String ?? ""
        self.occupation = dictionary["occupation"] as? String ?? ""
        self.status = dictionary["status"] as? String ?? ""
        self.nickName = dictionary["nickname"] as? String ?? ""
        self.seasons = dictionary["appearance"] as? [Int] ?? []
        self.imageUrl = dictionary["img"] as? String ?? ""
    }

}
