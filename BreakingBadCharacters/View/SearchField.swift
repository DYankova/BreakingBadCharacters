//
//  SearchCharField.swift
//  BreakingBadCharacters
//
//  Created by Didi on 21.02.20.
//  Copyright © 2020 Didi. All rights reserved.
//

import UIKit

class SearchField: UITextField {

override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
      
    private func setup(){
        placeholder = "Search in Characters"
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        font = .systemFont(ofSize: 15)
        layer.cornerRadius = 4
        textColor = .black
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

}
