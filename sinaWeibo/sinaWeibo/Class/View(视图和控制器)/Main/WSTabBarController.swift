//
//  WSTabBarController.swift
//  sinaWeibo
//
//  Created by wusheng on 2018/2/7.
//  Copyright © 2018年 ws. All rights reserved.
//

import UIKit

class WSTabBarController: UITabBarController {
    
    // 加号按钮
    lazy var composeButton: UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = UIColor.orange
        // 初始化控制器
        setupChildController()
        
        // 添加加号按钮
        setupComposeButton()
    }
    
    // 监听加号按钮的点击
    @objc private func composeButtonClick() {
        print("发微博")
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return.portrait
    }
    
    
    
}

// MARK:- 初始化控制器
extension WSTabBarController {
    /// 设置所有的控制器
    private func setupChildController() {
        // 控制器字典
        let array = [
            ["className" : "WSHomeViewController", "title" : "首页", "imageName" : "home"],
            ["className" : "WSMessageViewController", "title" : "消息", "imageName" : "message_center"],
            ["className" : "UIViewController"],
            ["className" : "WSDiscoverViewController", "title" : "发现", "imageName" : "discover"],
            ["className" : "WSProfileViewController", "title" : "我", "imageName" : "profile"]
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
        // 实例化导航控制器的时候，会调用 push 方法将 rootVC 压栈
        let nav = WSNavigationController(rootViewController: vc)
        return nav
    }
    
    // MARK:- 加号按钮
    private func setupComposeButton() {
        tabBar.addSubview(composeButton)
        // 计算按钮的宽高
        let count = CGFloat(childViewControllers.count)
        let W = tabBar.bounds.width / count - 0.5
        composeButton.frame = tabBar.bounds.insetBy(dx: 2*W, dy: 0)
//        composeButton.frame = CGRect(x: buttonW*2, y: 0, width: buttonW, height: buttonH)
        composeButton.addTarget(self, action: #selector(composeButtonClick), for: .touchUpInside)
        
    }
    
}

// MARK:- 123
extension WSTabBarController {
    
}









