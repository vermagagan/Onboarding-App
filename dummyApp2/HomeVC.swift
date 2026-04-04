import UIKit

class HomeVC: UIViewController {

   

    // MARK: - UI Elements
    let welcomeLabel = UILabel()
    let cardsStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }

    func setupUI() {
        // 1. Setup Welcome Label
        // Using the user default value you set up in the previous steps
        let savedName = UserDefaults.standard.string(forKey: "userName") ?? "Sarah"
        welcomeLabel.text = "Welcome back,\n\(savedName)!"
        welcomeLabel.numberOfLines = 0
        welcomeLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        welcomeLabel.textColor = AppColors.primary
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)

        // 2. Setup StackView for Cards
        cardsStackView.axis = .vertical
        cardsStackView.spacing = 16
        cardsStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardsStackView)

        // 3. Create and Add the Cards
        // Using SF Symbols that closely match your screenshot
        let card1 = createActivityCard(iconName: "figure.walk", title: "Morning Walk", subtitle: "20 min")
        let card2 = createActivityCard(iconName: "figure.mind.and.body", title: "Yoga Session", subtitle: "20 min | Intensity")
        let card3 = createActivityCard(iconName: "dumbbell.fill", title: "Strength Training", subtitle: "30 min | Intensity")

        cardsStackView.addArrangedSubview(card1)
        cardsStackView.addArrangedSubview(card2)
        cardsStackView.addArrangedSubview(card3)

        // 4. Constraints
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            cardsStackView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 30),
            cardsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            cardsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }

    // MARK: - Helper to build individual cards
    func createActivityCard(iconName: String, title: String, subtitle: String) -> UIView {
        let container = UIView()
        container.backgroundColor = AppColors.cardBackground
        container.layer.cornerRadius = 16
        container.translatesAutoresizingMaskIntoConstraints = false
        
        // Icon
        let iconView = UIImageView(image: UIImage(systemName: iconName))
        iconView.tintColor = AppColors.primary
        iconView.contentMode = .scaleAspectFit
        iconView.translatesAutoresizingMaskIntoConstraints = false
        
        // Title
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = .label
        
        // Subtitle
        let subtitleLabel = UILabel()
        subtitleLabel.text = subtitle
        subtitleLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        subtitleLabel.textColor = .darkGray
        
        // Text Stack (Vertical)
        let textStack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        textStack.axis = .vertical
        textStack.spacing = 4
        textStack.translatesAutoresizingMaskIntoConstraints = false
        
        // Chevron (Right Arrow)
        let chevronView = UIImageView(image: UIImage(systemName: "chevron.right"))
        chevronView.tintColor = .systemGray3
        chevronView.contentMode = .scaleAspectFit
        chevronView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add subviews
        container.addSubview(iconView)
        container.addSubview(textStack)
        container.addSubview(chevronView)
        
        // Card internal constraints
        NSLayoutConstraint.activate([
            container.heightAnchor.constraint(equalToConstant: 80),
            
            iconView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            iconView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 30),
            iconView.heightAnchor.constraint(equalToConstant: 30),
            
            textStack.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 16),
            textStack.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            
            chevronView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            chevronView.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            chevronView.widthAnchor.constraint(equalToConstant: 15),
            chevronView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        return container
    }
}
