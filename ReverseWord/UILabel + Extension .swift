//
//  UILabel + Extension .swift
//  ReverseWord
//
//  Created by Olga Dragon on 13.12.2024.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, weight: UIFont.Weight, size: CGFloat, textColor: UIColor, textAlignment: NSTextAlignment = .center){
        self.init()
        self.text = text
        self.font = .systemFont(ofSize: size, weight: weight)
        self.textColor = textColor
        self.numberOfLines = 0
        self.textAlignment = textAlignment
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }

}
