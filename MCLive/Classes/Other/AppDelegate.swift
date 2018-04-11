//
//  AppDelegate.swift
//  MCLive
//
//  Created by admin on 2018/4/9.
//  Copyright © 2018年 BlueSkyer-25. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow.init(frame:UIScreen.main.bounds)
        self.window?.layer.cornerRadius = 5
        self.window?.layer.masksToBounds = true
        self.window?.backgroundColor = UIColor.white
        
        //MARK: 设置根视图
        let nav = MCTabbarController.init()
        self.window?.rootViewController = nav
        
        //MARK: 广告页
//        let adImagePath = Bundle.main.path(forResource: "adImage2", ofType: "jpg") //本地图片
//        //let adImagePath = Bundle.main.path(forResource: "adImage4", ofType: "gif") //本地gif
//        //let adImagePath = "http://img.ui.cn/data/file/3/4/6/210643.gif"              //网络图片
//        let _ = JDLAdvertisingView.init(adUrl: adImagePath!,didClickAdViewCompletion: {})
        
        self.window?.makeKeyAndVisible()
        return true
    }
}

