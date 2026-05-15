import UIKit

struct Stat {
    let title: String
    let value: String
    let iconName: String
    let color: UIColor
}

class ProgressTabVC: UIViewController {
    
    // MARK: - Mock Data
    private let stats: [Stat] = [
        Stat(title: "Steps", value: "10,412", iconName: "figure.walk", color: .systemOrange),
        Stat(title: "Calories", value: "650", iconName: "flame.fill", color: .systemRed),
        Stat(title: "Workouts", value: "5", iconName: "dumbbell.fill", color: .systemIndigo),
        Stat(title: "Sleep", value: "8h 15m", iconName: "bed.double.fill", color: .systemBlue)
    ]
    
    // MARK: - UI Elements
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColors.header
        label.text = "Your Progress"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Weekly", "Monthly"])
        sc.selectedSegmentIndex = 0
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    private var collectionView: UICollectionView!
    private let chartView = BarChartView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupCollectionView()
        layoutUI()
        
        // Feed some dummy heights to the chart
        chartView.setupBars(data: [40, 70, 30, 90, 50, 80, 45])
    }
    
    // MARK: - Setup
    private func setupCollectionView() {
        let layout = createCompositionalLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.register(StatCell.self, forCellWithReuseIdentifier: "StatCell")
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(160))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func layoutUI() {
        view.addSubview(titleLabel)
        view.addSubview(segmentedControl)
        view.addSubview(collectionView)
        view.addSubview(chartView)
        
        chartView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Title
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Segmented Control
            segmentedControl.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40),
            
            // Collection View
            collectionView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 340), // Height for 2 rows
            
            // Chart View
            chartView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            chartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            chartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            chartView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

// MARK: - CollectionView DataSource
extension ProgressTabVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stats.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StatCell", for: indexPath) as! StatCell
        let stat = stats[indexPath.item]
        cell.configure(with: stat)
        return cell
    }
}

// MARK: - Custom Cell
class StatCell: UICollectionViewCell {
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private let iconImageView = UIImageView()
    private let valueLabel = UILabel()
    private let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor.systemGray6
        contentView.layer.cornerRadius = 20
        setupCellLayout()
    }

    private func setupCellLayout() {
        iconImageView.contentMode = .scaleAspectFit
        valueLabel.font = .systemFont(ofSize: 22, weight: .bold)
        titleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        titleLabel.textColor = .secondaryLabel
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(valueLabel)
        stackView.addArrangedSubview(titleLabel)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 30),
            iconImageView.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configure(with stat: Stat) {
        titleLabel.text = stat.title
        valueLabel.text = stat.value
        iconImageView.image = UIImage(systemName: stat.iconName)
        iconImageView.tintColor = stat.color
    }

    required init?(coder: NSCoder) { fatalError() }
}

// MARK: - Chart View
class BarChartView: UIView {
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .bottom
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    func setupBars(data: [CGFloat]) {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor)
        ])

        // Clear existing bars if any
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        for value in data {
            let bar = UIView()
            bar.backgroundColor = .systemRed
            bar.layer.cornerRadius = 6
            bar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            bar.translatesAutoresizingMaskIntoConstraints = false
            bar.heightAnchor.constraint(equalToConstant: value).isActive = true
            stackView.addArrangedSubview(bar)
        }
    }
}
