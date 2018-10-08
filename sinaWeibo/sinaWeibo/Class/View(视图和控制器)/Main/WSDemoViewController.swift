//
//  WSDemoViewController.swift
//  sinaWeibo
//
//  Created by wusheng on 2018/3/29.
//  Copyright © 2018年 ws. All rights reserved.
//

import UIKit

class WSDemoViewController: WSBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "第\(navigationController?.childViewControllers.count ?? 0)个"

//        setupUI()
    }
    
    @objc private func showNext() {
        let vc = WSDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension WSDemoViewController {
    
    override func setupUI() {
        super.setupUI()
//        navigationItem.rightBarButtonItem
//        navItem.rightBarButtonItem = UIBarButtonItem.init(title: "下一个", style: .plain, target: self, action: #selector(showNext))
        
        navItem.rightBarButtonItem = UIBarButtonItem.init(title: "下一个", target: self, action: #selector(showNext))
        
    }
}
