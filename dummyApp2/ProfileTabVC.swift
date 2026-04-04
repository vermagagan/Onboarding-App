//
//  ProfileTabVC.swift
//  dummyApp2
//
//  Created by Gagan Verma on 30/03/26.
//

import UIKit

class ProfileTabVC: UIViewController {
    let label = UILabel()
    let subheading = UILabel()
    let SFImage = UIImageView()
    let resetButton = UIButton(type: .system)
    var name: String = ""

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
        SFImage.image = UIImage(systemName: "person.circle")
        SFImage.tintColor = AppColors.primary
        SFImage.contentMode = .scaleAspectFill
        SFImage.backgroundColor = .systemBackground
        SFImage.clipsToBounds = true
        SFImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(SFImage)
        
        label.text = UserDefaults.standard.string(forKey: "userName")
        label.textColor = AppColors.header
        label.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        
        
        if let date = UserDefaults.standard.object(forKey: "dateJoined") as? Date {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium      // gives "Apr 1, 2026"
            formatter.timeStyle = .none
            subheading.text = "Joined \(formatter.string(from: date))"
        } else {
            subheading.text = "Date Joined: Unknown"
        }
        
        subheading.textColor = AppColors.subtitle
        subheading.font = UIFont.systemFont(ofSize: 18)
        subheading.textAlignment = .center
        subheading.numberOfLines = 0
        subheading.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(subheading)
        
        resetButton.backgroundColor = AppColors.primary
        resetButton.setTitle("Reset Onboarding", for: .normal)
        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        resetButton.setTitleColor(.white, for: .normal)
        resetButton.layer.cornerRadius = 10
        
        resetButton.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(resetButton)
        
        NSLayoutConstraint.activate([
            
            SFImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            SFImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            SFImage.widthAnchor.constraint(equalToConstant: 240),
            SFImage.heightAnchor.constraint(equalToConstant: 240),
            
            label.topAnchor.constraint(equalTo: SFImage.bottomAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
           
            
            subheading.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            subheading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            subheading.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            resetButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            resetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resetButton.heightAnchor.constraint(equalToConstant: 50)
        ])

    }
    @objc func resetTapped() {
        // 1. Remove the stored data
        UserDefaults.standard.removeObject(forKey: "userName")
        UserDefaults.standard.removeObject(forKey: "dateJoined")
        
        // 2. Find the app's main window (iOS 13+ SceneDelegate approach)
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return
        }
        
        // 3. Initialize your first screen
        let firstScreenVC = LandingPageVC(transitionStyle: .scroll, navigationOrientation: .horizontal)
        let transition = CATransition()
            transition.duration = 0.3
            transition.type = .push
            transition.subtype = .fromLeft // Use .fromRight if you want it to slide the other way
            transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            
            // 5. Apply the animation to the window's layer
            window.layer.add(transition, forKey: kCATransition)
        
        // 5. Swap the root view controller
        window.rootViewController = firstScreenVC
        window.makeKeyAndVisible()
    }
    
}

