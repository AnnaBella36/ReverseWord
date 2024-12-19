//
//  TextField.swift
//  ReverseWord
//
//  Created by Olga Dragon on 11.12.2024.
//

import Foundation
import UIKit
//MARK: TypingTextFieldProtocol
protocol TypingTextFieldProtocol: AnyObject{
    func typingText(text: String)
    //когда нажимаю кнопку очистить
    func clearOutTextField()

}
class TextField: UITextField{
    
    weak var textFieldDelegate: TypingTextFieldProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        delegate =  self
        
    }
    
    private func configure(){
        backgroundColor = .white
        borderStyle = .none
        textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        leftViewMode = .always
        placeholder = "Text to reverse"
        font = UIFont(name: "Apple SD Gothic Neo", size: 20)
        tintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        clearButtonMode = .always
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//MARK: UITextFieldDelegate
extension TextField: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {return true}
        textFieldDelegate?.typingText(text: text)
        return true
    }
    
    //кнопка очистить
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textFieldDelegate?.clearOutTextField()
        return true
    }
}
