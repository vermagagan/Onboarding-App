//
//  WelcomeVC.swift
//  dummyApp2
//
//  Created by Gagan Verma on 30/03/26.
//

import UIKit
class WelcomeVC: UIViewController {
    let label = UILabel()
    let subheading = UILabel()
    let SFImage = UIImageView()
    let nextButton = UIButton(type: .system)
    
    var onNextAction : (() -> Void)?

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
        SFImage.image = UIImage(systemName: "leaf.arrow.trianglehead.clockwise")
        SFImage.tintColor = AppColors.primary
        SFImage.contentMode = .scaleAspectFill
        SFImage.backgroundColor = .systemBackground
        SFImage.clipsToBounds = true
        SFImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(SFImage)
        
        label.text = "Welcome to FitLife"
        label.textColor = AppColors.header
        label.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        subheading.text = "Your Personal Fitness Companion"
        subheading.textColor = AppColors.subtitle
        subheading.font = UIFont.systemFont(ofSize: 18)
        subheading.textAlignment = .center
        subheading.numberOfLines = 0
        subheading.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(subheading)
        
        nextButton.backgroundColor = AppColors.primary
        nextButton.setTitle("Next", for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.cornerRadius = 10
        
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            SFImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            SFImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            SFImage.widthAnchor.constraint(equalToConstant: 240),
            SFImage.heightAnchor.constraint(equalToConstant: 240),
            
            label.topAnchor.constraint(equalTo: SFImage.bottomAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            subheading.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            subheading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subheading.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])

    }
    
    @objc func nextTapped(){
        onNextAction?()
    }
}
