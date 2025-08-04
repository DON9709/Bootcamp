//
//  MainTabBarController.swift
//  BookFinder
//
//  Created by 이돈혁 on 8/4/25.
//



import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    private func setupTabBar() {
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        searchVC.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 0)

        let savedVC = UINavigationController(rootViewController: SavedBooksViewController())
        savedVC.tabBarItem = UITabBarItem(title: "저장됨", image: UIImage(systemName: "bookmark"), tag: 1)

        viewControllers = [searchVC, savedVC]
    }
}
