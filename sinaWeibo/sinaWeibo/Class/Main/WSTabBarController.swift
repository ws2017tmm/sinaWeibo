//
//  WSTabBarController.swift
//  sinaWeibo
//
//  Created by wusheng on 2018/2/7.
//  Copyright © 2018年 ws. All rights reserved.
//

import UIKit

class WSTabBarController: UITabBarController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = UIColor.orange
        
        addChildViewController(childVc: WSHomeTableViewController(), title: "首页", imageName: "tabbar_home")
        
        addChildViewController(childVc: WSMessageTableViewController(), title: "消息", imageName: "tabbar_message_center")
        
        addChildViewController(childVc: WSDiscoverTableViewController(), title: "发现", imageName: "tabbar_discover")
        
        addChildViewController(childVc: WSProfileTableViewController(), title: "我", imageName: "tabbar_profile")
    }
    
    private func addChildViewController(childVc: UIViewController, title : String, imageName : String) {
        
        // 设置title和image
        childVc.title = title
        childVc.tabBarItem.image = UIImage(named: imageName)
        childVc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
//        childVc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")?.withRenderingMode(.alwaysOriginal)
        
        let nav = UINavigationController(rootViewController: childVc)
        
        self.addChildViewController(nav)
    }

}
