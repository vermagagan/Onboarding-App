import UIKit

class LandingPageVC: UIPageViewController {

    private(set) lazy var pages:[UIViewController] = {
        return [
            WelcomeVC(),
            ProgressVC(),
            NameVC()
        ]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        if let firstVC = pages.first{
            setViewControllers([firstVC], direction: .forward, animated: true)
        }
        
        view.backgroundColor = .clear
        
        
        let appearence = UIPageControl.appearance(whenContainedInInstancesOf: [LandingPageVC.self])
        appearence.pageIndicatorTintColor = .systemGray
        appearence.currentPageIndicatorTintColor = .white
        appearence.backgroundColor = .clear
        
        
        setupNextPrevAction()
    }
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            for subView in view.subviews {
                // FIX: Stretch scrollview to edges to remove top/bottom bars
                if let scrollView = subView as? UIScrollView {
                    scrollView.frame = view.bounds
                }
                // FIX: Move dots up so they aren't hidden at the very bottom
                else if let pageControl = subView as? UIPageControl {
                    pageControl.transform = CGAffineTransform(translationX: 0, y: -50)
                    view.bringSubviewToFront(pageControl)
                }
            }
        }
        
        // FIX: Tells iOS to ignore the default top shadow for this controller
        override var preferredStatusBarStyle: UIStatusBarStyle {
            return .darkContent // Use .darkContent for dark text on your yellow background
        }
    func gotopage(index: Int){
        guard index < pages.count else {return}
        setViewControllers([pages[index]], direction: .forward, animated: true)
    }
    func backtopage(index: Int){
        guard index < pages.count else {return}
        setViewControllers([pages[index]], direction: .reverse, animated: true)
    }
    func setupNextPrevAction(){
        for(index, page) in pages.enumerated(){
            switch page{
            case let vc as WelcomeVC:
                vc.onNextAction = {[weak self] in self?.gotopage(index: index+1)}
            case let vc as ProgressVC:
                vc.onNextAction = {[weak self] in self?.gotopage(index: index+1)}
                vc.onPrevAction = {[weak self] in self?.backtopage(index: index-1)}
            case let vc as NameVC:
                vc.onNext = {[weak self] name in
                    UserDefaults.standard.set(name, forKey: "userName")
                    
                    let getStarted = GetStartedVC()
                    getStarted.name = name
                    
                    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                          let window = windowScene.windows.first else {return}
                    window.rootViewController = getStarted
                    window.makeKeyAndVisible()
                    
                }
            default:
                break
            }
        }
    }
}

extension LandingPageVC: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index > 0 else{return nil}
                return pages[index-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index < pages.count - 1 else{return nil}
                return pages[index+1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let currentVC = viewControllers?.first,
              let index = pages.firstIndex(of: currentVC) else {return 0}
        return index
    }
}
