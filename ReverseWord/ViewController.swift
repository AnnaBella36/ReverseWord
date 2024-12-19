//
//  ViewController.swift
//  ReverseWord
//
//  Created by Olga Dragon on 11.12.2024.
//

import UIKit

class ReverseViewController: UIViewController {
    
    
    let labelTitleBig = UILabel(text: "Reverse Words", weight: .bold, size: 34, textColor: .black)
    let labelTitle = UILabel(text: "Reverse Words", weight: .bold, size: 17, textColor: .black)
    let labelInform = UILabel(text: "This application will reverse your words. Please type text below", weight: .regular, size: 17, textColor: .gray)
    let labelForReverseText = UILabel(text: "", weight: .semibold, size: 20, textColor: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), textAlignment: .left)
    
    
    let reverseTextField = TextField()
    let reverseButton = ReveseButton()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        print("added from server")
        view.backgroundColor = #colorLiteral(red: 0.7127910554, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        addViews()
        setConstraints()
        reverseTextField.textFieldDelegate = self
    }
    
    
    func addViews(){
        view.addSubview(labelTitle)
        view.addSubview(labelTitleBig)
        view.addSubview(labelInform)
        view.addSubview(reverseTextField)
        view.addSubview(labelForReverseText)
        view.addSubview(reverseButton)
    
        reverseButton.addTarget(self, action: #selector(reverseButtonTapped), for: .touchUpInside)
        
    }
    
    @objc func reverseButtonTapped(){
                guard let text = reverseTextField.text else {return}
                var newText = ""
                for char in text.reversed(){
                    newText.append(char)
                }
        labelForReverseText.text = newText

        }
  
    }

    //MARK: TypingTextFieldProtocol
extension ReverseViewController: TypingTextFieldProtocol{

    func typingText(text: String) {
            reverseButton.isValid = !text.isEmpty
        }
    
    func clearOutTextField() {
        reverseTextField.text = ""
        labelForReverseText.text = ""
        
    }
    
    }

    
    //MARK: setConstraints
    extension ReverseViewController{
        
        func setConstraints(){
            NSLayoutConstraint.activate([
                labelTitle.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
                labelTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                labelTitleBig.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 80),
                labelTitleBig.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                labelInform.topAnchor.constraint(equalTo: labelTitleBig.bottomAnchor, constant: 20),
                labelInform.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                labelInform.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                labelInform.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                
                reverseTextField.topAnchor.constraint(equalTo: labelInform.bottomAnchor, constant: 50),
                reverseTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                reverseTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                labelForReverseText.topAnchor.constraint(equalTo: reverseTextField.bottomAnchor, constant: 20),
                labelForReverseText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                labelForReverseText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                
                reverseButton.topAnchor.constraint(equalTo: reverseTextField.bottomAnchor, constant: 400),
                reverseButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
                reverseButton.heightAnchor.constraint(equalToConstant: 60),
                reverseButton.widthAnchor.constraint(equalToConstant: 349)
                
                
            ])
        }
    }


