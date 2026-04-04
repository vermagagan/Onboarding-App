//
//  NameVC.swift
//  dummyApp2
//
//  Created by Gagan Verma on 30/03/26.
//

import UIKit

class NameVC: UIViewController, UITextFieldDelegate {

    let label = UILabel()
    let textField = UITextField()
    let SFImage = UIImageView()
    let nextButton = UIButton(type: .system)
    
    var onNext : ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            let dynamicRadius = SFImage.frame.height / 2.0
            
            if SFImage.layer.cornerRadius != dynamicRadius {
                SFImage.layer.cornerRadius = dynamicRadius
            }
        }
    
    func setupUI(){
        label.text = "What should we call you?"
        label.textColor = AppColors.header
        label.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        textField.placeholder = "Enter your name"
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 17)
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(textField)
        SFImage.image = UIImage(systemName: "person.circle")
        SFImage.tintColor = AppColors.primary
        SFImage.contentMode = .scaleAspectFill
        SFImage.backgroundColor = .systemBackground
        SFImage.clipsToBounds = true
        SFImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(SFImage)
        
        nextButton.backgroundColor = AppColors.primary
        nextButton.setTitle("Next", for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.cornerRadius = 10
        
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            SFImage.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            SFImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            SFImage.widthAnchor.constraint(equalToConstant: 240),
            SFImage.heightAnchor.constraint(equalToConstant: 240),
            
            
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])

    }
    
    @objc func nextTapped(){
        guard let name = textField.text, !name.isEmpty else{
            let alert = UIAlertController(title: "Alert!", message: "Please enter your name first!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Done", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
            return
        }
        onNext?(name)
    }
}
