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
        
        setupChildController()
        
//        addChildViewController(childVc: WSHomeTableViewController(), title: "首页", imageName: "tabbar_home")
//
//        addChildViewController(childVc: WSMessageTableViewController(), title: "消息", imageName: "tabbar_message_center")
//
//        addChildViewController(childVc: WSDiscoverTableViewController(), title: "发现", imageName: "tabbar_discover")
//
//        addChildViewController(childVc: WSProfileTableViewController(), title: "我", imageName: "tabbar_profile")
    }
    
//    private func addChildViewController(childVc: UIViewController, title : String, imageName : String) {
//
//        // 设置title和image
//        childVc.title = title
//        childVc.tabBarItem.image = UIImage(named: imageName)
//        childVc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
//        //        childVc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")?.withRenderingMode(.alwaysOriginal)
//
//        let nav = UINavigationController(rootViewController: childVc)
//
//        self.addChildViewController(nav)
//    }
    
    
    
    
}

// MARK:- 初始化控制器
extension WSTabBarController {
    /// 设置所有的控制器
    func setupChildController() {
        // 控制器字典
        let array = [
            ["className" : "WSHomeTableViewController", "title" : "首页", "imageName" : "home"],
            ["className" : "WSHomeTableViewController", "title" : "消息", "imageName" : "message_center"],
            ["className" : "WSHomeTableViewController", "title" : "发现", "imageName" : "discover"],
            ["className" : "WSHomeTableViewController", "title" : "我", "imageName" : "profile"]
        ]
        
        var arrayM = [UIViewController]()
        // 遍历字典，创建控制器
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        // 设置子控制器
        viewControllers = arrayM
    }
    
    /// 使用字典创建控制器
    private func controller(dict: [String : String]) -> UIViewController {
        guard let className = dict["className"],
              let title = dict["title"],
              let imageName = dict["imageName"],
              let cls = NSClassFromString(Bundle.main.namespace + "." + className) as? WSBaseViewController.Type
            else {
                return UIViewController()
        }
        
        let vc = cls.init()
        vc.title = title
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_highlighted")
        
        return vc
    }
}











