//
//  ProgressVC.swift
//  dummyApp2
//
//  Created by Gagan Verma on 30/03/26.
//

import UIKit

class ProgressVC: UIViewController {

    let headerColor = UIColor(white: 0.15, alpha: 1.0)
    let subtitleColor = UIColor.systemGray
    
    let label = UILabel()
    let subheading = UILabel()
    let SFImage = UIImageView()
    let nextButton = UIButton(type: .system)
    let prevButton = UIButton(type: .system)
    
    var onNextAction : (() -> Void)?
    var onPrevAction: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
        
    }
    
    func setupUI(){
        SFImage.image = UIImage(systemName: "chart.xyaxis.line")
        SFImage.tintColor = .systemOrange
        SFImage.contentMode = .scaleAspectFill
        SFImage.backgroundColor = .systemBackground
        SFImage.clipsToBounds = true
        SFImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(SFImage)
        
        label.text = "Track Your Progress"
        label.textColor = headerColor
        label.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        subheading.text = "Log workout, monitor calories, hit your goals"
        subheading.textColor = subtitleColor
        subheading.font = UIFont.systemFont(ofSize: 18)
        subheading.textAlignment = .center
        subheading.numberOfLines = 2
        subheading.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(subheading)
        
        nextButton.backgroundColor = .systemOrange
        nextButton.setTitle("Next", for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.cornerRadius = 10
        
        nextButton.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nextButton)
        
        let themeColor = UIColor(red: 0.88, green: 0.25, blue: 0.21, alpha: 1.0)
        prevButton.setTitleColor(themeColor, for: .normal)
        prevButton.backgroundColor = themeColor.withAlphaComponent(0.15)
        prevButton.setTitle("Prev", for: .normal)
        prevButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        prevButton.setTitleColor(.systemOrange, for: .normal)
        prevButton.layer.cornerRadius = 10
        
        prevButton.addTarget(self, action: #selector(prevTapped), for: .touchUpInside)
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(prevButton)
        
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
            nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 50),
            
            prevButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            prevButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            prevButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            prevButton.heightAnchor.constraint(equalToConstant: 50)
        ])

    }
    
    @objc func nextTapped(){
        onNextAction?()
    }
    @objc func prevTapped(){
        onPrevAction?()
    }
}
