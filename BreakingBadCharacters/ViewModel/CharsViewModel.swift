//
//  CharsViewModel.swift
//  BreakingBadCharacters
//
//  Created by Didi on 24.02.20.
//  Copyright © 2020 Didi. All rights reserved.
//

import UIKit

class CharsViewModel {

    let fetcher = Fetcher()
    var fetchedCharViewModels =  [CharacterViewModel]()
    var currentCharViewModels =  [CharacterViewModel]()
     
    func fetchData(completion: @escaping () -> Void) {
         fetcher.fetchAllCharacters { (fetchedCharViewModels) in
            self.fetchedCharViewModels = fetchedCharViewModels ?? []
            completion()
            self.currentCharViewModels = self.fetchedCharViewModels
       }
        
    }
    
    func searchCharacters(_ name: String, _ seasonText: String){
        
        cleanResults()
        let season = Int(seasonText) ?? 0
            
        if name != "" {
            filterByName(name)
        }
        if seasonText != "" {
             filterBySeason(season)
         }

        }
        
        func filterByName(_ name: String){
            currentCharViewModels = currentCharViewModels.filter { $0.name.lowercased().contains(name.lowercased())}
        }
            
        func filterBySeason(_ season: Int){
            currentCharViewModels = currentCharViewModels.filter{ $0.seasons.contains(season)}
       }
    
    func cleanResults(){
        currentCharViewModels = fetchedCharViewModels
    }
        
    
}
