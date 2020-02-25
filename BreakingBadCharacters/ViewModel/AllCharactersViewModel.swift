//
//  CharsViewModel.swift
//  BreakingBadCharacters
//
//  Created by Didi on 24.02.20.
//  Copyright © 2020 Didi. All rights reserved.
//

import UIKit

class AllCharactersViewModel {

    let fetcher = Fetcher()
    let filter = Filter()
    
    var fetchedCharactersViewModels =  [CharacterViewModel]()
    var filteredCharactersViewModels =  [CharacterViewModel]()
     
    func fetchData(completion: @escaping () -> Void) {
         fetcher.fetchAllCharacters { (fetchedCharactersViewModels) in
            self.fetchedCharactersViewModels = fetchedCharactersViewModels ?? []
            completion()
            self.filteredCharactersViewModels = self.fetchedCharactersViewModels
       }
    }
    
    func searchCharacters(_ name: String, _ seasonText: String){
        filteredCharactersViewModels = fetchedCharactersViewModels
        let season = Int(seasonText) ?? 0
            
        if name != "" {
           filteredCharactersViewModels = filter.filterByName(name, filteredCharactersViewModels )
        }
        
        if seasonText != "" {
          filteredCharactersViewModels =  filter.filterBySeason(season, filteredCharactersViewModels)
        }
    }
        
}
