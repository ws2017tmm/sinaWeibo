//
//  WSNavigationController.swift
//  sinaWeibo
//
//  Created by ws on 2018/2/8.
//  Copyright © 2018年 ws. All rights reserved.
//

import UIKit

class WSNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.isHidden = true
        navigationBar.tintColor = UIColor.black
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            
            
            if let vc = viewController as? WSBaseViewController {
                
                var title = "返回"
                
                if viewControllers.count == 1 {
                    title = childViewControllers.first?.title ?? title
                }
                
                // 取出自定义的navItem
                vc.navItem.leftBarButtonItem = UIBarButtonItem.init(title: title, target: self, action: #selector(back), isBack: true)
                
                
                
            }
            
            
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc private func back() {
        popViewController(animated: true)
    }
    
}

extension WSNavigationController {
    public class func initializeOnceMethod() {
        let item = UIBarButtonItem.appearance()
        
        let attributes = [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15),
            NSAttributedStringKey.foregroundColor : UIColor.black
        ]
        item.setTitleTextAttributes(attributes, for: .normal)
        
        let highlightedAttributes = [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15),
            NSAttributedStringKey.foregroundColor : UIColor.orange
        ]
        item.setTitleTextAttributes(highlightedAttributes, for: .highlighted)
        
        let disableAttributes = [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15),
            NSAttributedStringKey.foregroundColor : UIColor.lightGray
        ]
        item.setTitleTextAttributes(disableAttributes, for: .disabled)
    }
    
}



