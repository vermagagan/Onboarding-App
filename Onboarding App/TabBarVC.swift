import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = UINavigationController(rootViewController: HomeVC())
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 0)

        let progressVC = UINavigationController(rootViewController: ProgressTabVC())
        progressVC.tabBarItem = UITabBarItem(title: "Progress", image: UIImage(systemName: "chart.bar.fill"), tag: 1)

        let profileVC = UINavigationController(rootViewController: ProfileTabVC())
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 2)
        
        viewControllers = [homeVC, progressVC, profileVC]
        
        
        setupTabbarappearance()
        
    }
    
    private func setupTabbarappearance(){
        let appearance = UITabBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBackground
        
        let setselectedColor = AppColors.primary
        let setunselectedColor = AppColors.subtitle
        
        appearance.stackedLayoutAppearance.selected.iconColor = setunselectedColor
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: setunselectedColor]
        
        appearance.stackedLayoutAppearance.selected.iconColor = setselectedColor
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: setselectedColor]
        
        tabBar.standardAppearance = appearance
        
        if #available(iOS 15.0, *){
            tabBar.scrollEdgeAppearance = appearance
        }
        
        tabBar.tintColor = setselectedColor
        tabBar.unselectedItemTintColor = setunselectedColor
        
    }

}
