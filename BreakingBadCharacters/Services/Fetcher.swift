//
//  Fetcher.swift
//  BreakingBadCharacters
//
//  Created by Didi on 21.02.20.
//  Copyright © 2020 Didi. All rights reserved.
//

import UIKit
import Alamofire

class Fetcher {

   let basicURL = "https://breakingbadapi.com/api/characters"
   var charModels = [CharacterViewModel]()
    
 func fetchAllCharacters(completion: @escaping ([CharacterViewModel]?) -> Void) {
       guard let url = URL(string: basicURL) else {
         completion(nil)
         return
        }
   
       Alamofire.request(url,
                         method: .get,
                         parameters: ["include_docs": "true"])
       .validate()
       .responseJSON { response in
         guard response.result.isSuccess else {
           completion(nil)
           return
         }

        guard let values = response.result.value as? [[String: Any]] else {
            return
        }
        
        self.charModels = values.compactMap { charModel in  let md = CharacterViewModel(CharacterModel(charModel))
//            md.setImage()
            return md
    }
        self.getImages()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            completion(self.charModels)
        }
    }
 }

    func getImages(){
        self.charModels.forEach{ $0.imageView.loadImage(urlString: $0.model.imageUrl) }
    }
    
}
