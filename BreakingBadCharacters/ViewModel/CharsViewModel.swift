//
//  CharsViewModel.swift
//  BreakingBadCharacters
//
//  Created by Didi on 24.02.20.
//  Copyright © 2020 Didi. All rights reserved.
//

import UIKit

class CharsViewModel {

    //tuk e obsht vm
    //she se vika fetch
    let fetcher = Fetcher()
    var charViewModels =  [CharacterViewModel]()
     
    func fetchData(completion: @escaping () -> Void) {
         fetcher.fetchAllCharacters { (charViewModels) in
            self.charViewModels = charViewModels ?? []
            completion()
       }
        
    }
}
