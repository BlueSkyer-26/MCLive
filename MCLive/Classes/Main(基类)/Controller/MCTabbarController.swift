//
//  MCTabbarController.swift
//  MCLive
//
//  Created by admin on 2018/4/10.
//  Copyright © 2018年 BlueSkyer-25. All rights reserved.
//

import UIKit

class MCTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        initTabbarItem()
        addChildViewControllers()
        setupNewFeatureView()
    }
    func initTabbarItem() -> Void {
        let tabbar = UITabBar.appearance()
        tabbar.tintColor = MCThemeColor
        
        let tabbarItem = UITabBarItem.appearance()
        tabbarItem.titlePositionAdjustment = UIOffsetMake(0, -4)
    }
    
    func setupNewFeatureView() -> Void {
        
        if !UserDefaults.standard.bool(forKey: MCFirstLaunch) {
            let imageNameArray :[String] = ["welcome1","welcome2","welcome3"]
            let newFeatureView = MCNewFeatureView.init(imageArray: imageNameArray, isHideSkipButton: false)
            self.view.addSubview(newFeatureView)
            UserDefaults.standard.set(true, forKey: MCFirstLaunch)
        }
    }
    
    func addChildViewControllers() -> Void {
        setChildViewController(childViewController: MCHomeController(), title: "首页", imageName: "home")
        setChildViewController(childViewController: MCClassifyController(), title: "分类", imageName: "list")
        setChildViewController(childViewController: MCShoppingCartController(), title: "购物车", imageName: "cart")
        setChildViewController(childViewController: MCOrderController(), title: "订单", imageName: "order")
        setChildViewController(childViewController: MCProfileController(), title: "我", imageName: "people")
    }
    
    func setChildViewController(childViewController :UIViewController,title :String,imageName:String) -> Void {
        childViewController.tabBarItem.image = UIImage.init(named: imageName)
        childViewController.tabBarItem.selectedImage = UIImage.init(named: imageName + "-Select")
        childViewController.title = title
        
        let navVC = MCBaseNavigationController.init(rootViewController: childViewController)
        addChildViewController(navVC)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
