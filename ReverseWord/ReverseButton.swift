//
//  ReverseButton.swift
//  ReverseWord
//
//  Created by Olga Dragon on 11.12.2024.
//

import Foundation
import UIKit

class ReveseButton: UIButton{
    
    public var isValid: Bool = false{
        didSet{
            if self.isValid{
                setValidSettings()
            }else{
                setNotValidSettings()
            }
        }
        
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        configure()
    }
    
    private func configure(){
        backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        setTitle("Reverse", for: .normal)
        let color = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setTitleColor(color, for: .normal)
        isEnabled = false
        alpha = 0.5
        layer.cornerRadius = 10
        titleLabel?.font = UIFont(name: "Avenir Book", size: 17)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setNotValidSettings(){
        isEnabled = false
        alpha = 0.5
    }
    private func setValidSettings(){
        isEnabled = true
        alpha = 1
    }
  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
