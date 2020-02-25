//
//  Filter.swift
//  BreakingBadCharacters
//
//  Created by Didi on 25.02.20.
//  Copyright © 2020 Didi. All rights reserved.
//

import UIKit

class Filter {

    func filterByName(_ name: String, _ list: [CharacterViewModel]) -> [CharacterViewModel] {
        var list = list
        list = list.filter { $0.name.lowercased().contains(name.lowercased())}
        return list
  }
  
    func filterBySeason(_ season: Int, _ list: [CharacterViewModel])-> [CharacterViewModel] {
        var list = list
        list = list.filter{ $0.seasons.contains(season)}
        return list
    }

}
