//
//  CustomImageView.swift
//  BreakingBadCharacters
//
//  Created by Didi on 21.02.20.
//  Copyright © 2020 Didi. All rights reserved.
//

import UIKit
import AlamofireImage

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
 
    func loadImage(urlString: String) {
        if let imageURL = URL(string: urlString), let placeholder = UIImage(named: "default") {
            self.af_setImage(withURL: imageURL, placeholderImage: placeholder)
        }
    }
}
