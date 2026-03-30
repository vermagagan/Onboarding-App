//
//  GetStartedVC.swift
//  dummyApp2
//
//  Created by Gagan Verma on 30/03/26.
//

import UIKit

class GetStartedVC: UIViewController {
    let headerColor = UIColor(white: 0.15, alpha: 1.0)
    let subtitleColor = UIColor.systemGray
    
    let label = UILabel()
    let subheading = UILabel()
    let SFImage = UIImageView()
    let nextButton = UIButton(type: .system)
    var name: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        label.text = "You are all set \(name)!"
    }
    
    func setupUI(){
        SFImage.image = UIImage(systemName: "checkmark.shield.fill")
        SFImage.tintColor = .systemOrange
        SFImage.contentMode = .scaleAspectFill
        SFImage.backgroundColor = .systemBackground
        SFImage.clipsToBounds = true
        SFImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(SFImage)
        
        
        label.textColor = headerColor
        label.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        subheading.text = "Your Profile"
        subheading.textColor = subtitleColor
        subheading.font = UIFont.systemFont(ofSize: 18)
        subheading.textAlignment = .center
        subheading.numberOfLines = 0
        subheading.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(subheading)
        
        nextButton.backgroundColor = .systemOrange
        nextButton.setTitle("Get Started", for: .normal)
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
            
            SFImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            SFImage.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            SFImage.widthAnchor.constraint(equalToConstant: 240),
            SFImage.heightAnchor.constraint(equalToConstant: 240),
            
           
            
            subheading.topAnchor.constraint(equalTo: SFImage.bottomAnchor, constant: 10),
            subheading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subheading.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])

    }
    
    @objc func nextTapped(){
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {return}
        window.rootViewController = TabBarVC()
        window.makeKeyAndVisible()
    }
}

