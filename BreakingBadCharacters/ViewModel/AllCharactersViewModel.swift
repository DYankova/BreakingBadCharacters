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
    
    var fetchedCharViewModels =  [CharacterViewModel]()
    var filteredCharViewModels =  [CharacterViewModel]()
     
    func fetchData(completion: @escaping () -> Void) {
         fetcher.fetchAllCharacters { (fetchedCharViewModels) in
            self.fetchedCharViewModels = fetchedCharViewModels ?? []
            completion()
            self.filteredCharViewModels = self.fetchedCharViewModels
       }
    }
    
    func searchCharacters(_ name: String, _ seasonText: String){
        filteredCharViewModels = fetchedCharViewModels
        let season = Int(seasonText) ?? 0
            
        if name != "" {
           filteredCharViewModels = filter.filterByName(name, filteredCharViewModels )
        }
        
        if seasonText != "" {
          filteredCharViewModels =  filter.filterBySeason(season, filteredCharViewModels)
        }
    }
        
}
