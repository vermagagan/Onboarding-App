# 🏃 FitLife Onboarding App — iOS App

> App #2 of my iOS Development Journey | Built with Swift + UIKit | Zero Storyboards

---

## 📱 Overview

FitLife is a fully programmatic iOS fitness onboarding app that walks users through a personalized setup flow before landing them in a 3-tab home experience. Built as part of my structured iOS curriculum to master `UIPageViewController`, root view controller switching, `UITabBarController`, `UICollectionView` with Compositional Layout, and custom UI components.

---

## 🖥️ Screens

### 🎉 Onboarding Flow (3 Pages)
- **WelcomeVC** — App intro with branding and tagline
- **ProgressVC** — Features overview with highlights
- **NameVC** — Name input with empty field validation alert
- Swipe gesture support + Next / Prev navigation buttons
- Powered by `UIPageViewController` inside `LandingPageVC`

### ✅ Get Started Screen
- Personalized welcome — *"You're all set, [Name]!"*
- Transitions to the main tab bar experience
- Shown only once — app skips onboarding automatically on relaunch

### 🏠 Home Tab
- Displays saved user name in a welcome label
- 3 workout activity cards — each with icon, title, subtitle, and chevron

### 📊 Progress Tab
- 2×2 stats grid — Steps, Calories, Workouts, Sleep
- Built with `UICollectionView` + Compositional Layout
- Custom `BarChartView` built from scratch using `UIStackView`
- Weekly / Monthly segmented control

### 👤 Profile Tab
- Displays user name and formatted date joined
- **Reset Onboarding** button — clears `UserDefaults` and returns to onboarding with a `CATransition` animation

---

## ⚙️ Features

| Feature | Detail |
|---|---|
| Swipe onboarding | `UIPageViewController` with gesture + button navigation |
| Closures for navigation | Page-to-page actions wired via closures |
| Name personalization | Name passed forward and displayed across tabs |
| Onboarding skip | `SceneDelegate` checks `UserDefaults` on every launch |
| Root VC switching | `UIWindowScene` used to swap between onboarding and tab bar |
| Custom bar chart | `BarChartView` built as `UIView` subclass using `UIStackView` |
| Stats grid | `UICollectionView` with Compositional Layout |
| Reset with animation | `CATransition` on root VC switch back to onboarding |
| Design system | `Constants.swift` + `AppColors` enum for app-wide consistency |
| Date joined | Formatted with `DateFormatter` and stored in `UserDefaults` |

---

## 🛠️ Tech Stack

- **Language:** Swift
- **Framework:** UIKit
- **UI Approach:** 100% Programmatic — Zero Storyboards
- **Layout:** `NSLayoutConstraint` + `UIStackView`
- **Onboarding:** `UIPageViewController`
- **Tabs:** `UITabBarController` with custom appearance
- **Grid:** `UICollectionView` + Compositional Layout
- **Custom Component:** `BarChartView` (`UIView` subclass)
- **App Flow:** `SceneDelegate` + `UIWindowScene` root VC switching
- **Persistence:** `UserDefaults` (name + date joined)
- **Animation:** `CATransition`
- **Design System:** `Constants.swift` + `AppColors` enum

---

## 🧠 Concepts Practiced

| Concept | Where Used |
|---|---|
| `UIPageViewController` | `LandingPageVC` |
| Closures for navigation | `setupNextPrevAction()` |
| Passing data forward | Name across 3 onboarding screens |
| Root VC switching | `LandingPageVC` + `ProfileTabVC` |
| `SceneDelegate` logic | Onboarding skip on relaunch |
| `UITabBarController` | `TabBarVC` |
| Custom tab bar appearance | `setupTabBarAppearance()` |
| `UICollectionView` + Compositional Layout | `ProgressTabVC` stats grid |
| Custom `UIView` subclass | `BarChartView` |
| `UserDefaults` multi-value | Name + date joined |
| `DateFormatter` | Profile date display |
| `CATransition` animation | Reset transition |
| Constants file pattern | `AppColors` enum |
| Empty field validation | `NameVC` `nextTapped()` |

---


## 🚀 Getting Started

1. Clone the repo
   ```bash
   git clone https://github.com/YOUR_USERNAME/FitLife-iOS.git
   ```
2. Open `FitLife.xcodeproj` in Xcode
3. Run on Simulator (iOS 16+)

> No third-party dependencies. No CocoaPods. Pure UIKit.

---

## 👨‍💻 Author

**Gagan**
Aspiring iOS Developer | Building in public

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue)](https://linkedin.com/in/vermagagan)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black)](https://github.com/vermagagan)

---

> *"10 files, 3 tabs, a custom chart, and zero storyboards. This was the app that made navigation architecture finally click."*
